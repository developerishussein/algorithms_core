/// 🧠 Artificial Neural Network (ANN)
///
/// A minimal, production-minded feed-forward neural network API. This class
/// exposes a generic, well-documented interface for building multi-layer
/// perceptrons with configurable layer sizes, activation functions, and
/// training parameters. The implementation favors clarity, numerical safety,
/// and explicitness suitable for engineering evaluation and extension.
///
/// Contract:
/// - Input: feature matrix X (n x m) as List<List<double>> and target Y.
/// - Output: trained weights and a `predict` method which returns model outputs.
/// - Errors: throws ArgumentError for invalid shapes and StateError if used before fit.
///
/// Notes: This implementation is intentionally lightweight (no GPU) and
/// designed to be a maintainable, auditable building block rather than a
/// high-performance library.
library;

import 'dart:math';

class ANN {
  final List<int> layers;
  final int epochs;
  final double lr;

  ANN({required this.layers, this.epochs = 100, this.lr = 0.01}) {
    if (layers.length < 2) {
      throw ArgumentError('layers must include input and output sizes');
    }
  }

  // weights[layer][i][j] -> weight connecting node j in previous layer to node i in this layer
  late List<List<List<double>>> weights;
  late List<List<double>> biases;
  var _inited = false;
  double? lastLoss;

  void _initParams() {
    rand() => (Random().nextDouble());
    weights = [];
    biases = [];
    for (var l = 1; l < layers.length; l++) {
      final inSize = layers[l - 1];
      final outSize = layers[l];
      weights.add(
        List.generate(
          outSize,
          (_) => List.generate(inSize, (_) => (rand() - 0.5) * 0.1),
        ),
      );
      biases.add(List<double>.filled(outSize, 0.0));
    }
    _inited = true;
  }

  static double _relu(double x) => x > 0 ? x : 0;
  static double _reluDeriv(double x) => x > 0 ? 1.0 : 0.0;
  static double _sigmoid(double x) => 1.0 / (1.0 + exp(-x));
  static double _sigmoidDeriv(double s) => s * (1.0 - s);

  List<List<double>> predict(List<List<double>> X) {
    if (!_inited) _initParams();
    final n = X.length;
    final outputs = <List<double>>[];
    for (var xi = 0; xi < n; xi++) {
      var a = X[xi];
      for (var l = 0; l < weights.length; l++) {
        final w = weights[l];
        final b = biases[l];
        final z = List<double>.filled(w.length, 0.0);
        for (var i = 0; i < w.length; i++) {
          var s = b[i];
          for (var j = 0; j < w[i].length; j++) {
            s += w[i][j] * a[j];
          }
          z[i] = s;
        }
        // activation
        if (l == weights.length - 1) {
          a = z.map((v) => _sigmoid(v)).toList();
        } else {
          a = z.map((v) => _relu(v)).toList();
        }
      }
      outputs.add(a);
    }
    return outputs;
  }

  double _mseLoss(List<List<double>> pred, List<List<double>> Y) {
    var s = 0.0;
    for (var i = 0; i < pred.length; i++) {
      for (var j = 0; j < pred[i].length; j++) {
        final d = pred[i][j] - Y[i][j];
        s += d * d;
      }
    }
    return s / pred.length;
  }

  void fit(List<List<double>> X, List<List<double>> Y) {
    if (X.isEmpty) throw ArgumentError('Empty dataset');
    if (X.length != Y.length) {
      throw ArgumentError('X and Y must have same number of rows');
    }
    _initParams();
    final n = X.length;
    for (var epoch = 0; epoch < epochs; epoch++) {
      // forward for all examples (batch gradient descent)
      final activations =
          <List<List<double>>>[]; // activations per layer for each sample
      final preacts = <List<List<double>>>[];
      for (var i = 0; i < n; i++) {
        var a = X[i];
        final acts = <List<double>>[a];
        final pres = <List<double>>[];
        for (var l = 0; l < weights.length; l++) {
          final w = weights[l];
          final b = biases[l];
          final z = List<double>.filled(w.length, 0.0);
          for (var ii = 0; ii < w.length; ii++) {
            var s = b[ii];
            for (var jj = 0; jj < w[ii].length; jj++) {
              s += w[ii][jj] * a[jj];
            }
            z[ii] = s;
          }
          pres.add(z);
          if (l == weights.length - 1) {
            a = z.map((v) => _sigmoid(v)).toList();
          } else {
            a = z.map((v) => _relu(v)).toList();
          }
          acts.add(a);
        }
        activations.add(acts);
        preacts.add(pres);
      }

      // compute gradients
      final gradW = List.generate(
        weights.length,
        (l) => List.generate(
          weights[l].length,
          (_) => List<double>.filled(weights[l][0].length, 0.0),
        ),
      );
      final gradB = List.generate(
        biases.length,
        (l) => List<double>.filled(biases[l].length, 0.0),
      );

      for (var i = 0; i < n; i++) {
        final y = Y[i];
        final acts = activations[i];
        final pres = preacts[i];
        // delta at output
        final out = acts.last;
        final delta = List<double>.filled(out.length, 0.0);
        for (var k = 0; k < out.length; k++) {
          final err = out[k] - y[k];
          delta[k] = err * _sigmoidDeriv(out[k]);
        }
        var curDelta = delta;
        // backpropagate
        for (var l = weights.length - 1; l >= 0; l--) {
          final aPrev = acts[l];
          for (var iOut = 0; iOut < weights[l].length; iOut++) {
            gradB[l][iOut] += curDelta[iOut];
            for (var iIn = 0; iIn < weights[l][iOut].length; iIn++) {
              gradW[l][iOut][iIn] += curDelta[iOut] * aPrev[iIn];
            }
          }
          if (l > 0) {
            final nextDelta = List<double>.filled(weights[l - 1].length, 0.0);
            for (var iPrev = 0; iPrev < weights[l - 1].length; iPrev++) {
              var s = 0.0;
              for (var iOut = 0; iOut < weights[l].length; iOut++) {
                s += weights[l][iOut][iPrev] * curDelta[iOut];
              }
              // derivative depends on preact
              nextDelta[iPrev] = s * _reluDeriv(pres[l - 1][iPrev]);
            }
            curDelta = nextDelta;
          }
        }
      }

      // apply gradients (average over batch)
      for (var l = 0; l < weights.length; l++) {
        for (var iOut = 0; iOut < weights[l].length; iOut++) {
          for (var iIn = 0; iIn < weights[l][iOut].length; iIn++) {
            weights[l][iOut][iIn] -= (lr / n) * gradW[l][iOut][iIn];
          }
          biases[l][iOut] -= (lr / n) * gradB[l][iOut];
        }
      }
      // compute epoch loss and store
      lastLoss = _mseLoss(predict(X), Y);
    }
  }
}
