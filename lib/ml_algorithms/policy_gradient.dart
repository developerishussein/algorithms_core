/// Policy Gradient (REINFORCE) - minimal numeric implementation
///
/// A concise REINFORCE-style policy gradient agent that uses an MLP policy to
/// produce action probabilities for discrete actions. This implementation is
/// intentionally small for teaching and unit testing (no baselines by default)
/// but exposes the core API needed in real experiments: `selectAction` and
/// `updateFromEpisode`.
///
library;

import 'dart:convert';
import 'dart:math';
import 'package:algorithms_core/ml_algorithms/ann.dart';

class PolicyGradient {
  final int nActions;
  final ANN policy;
  final Random _rand;

  PolicyGradient({
    required this.nActions,
    required List<int> policyLayers,
    int? seed,
  }) : _rand = seed != null ? Random(seed) : Random(),
       policy = ANN(layers: policyLayers, seed: seed) {
    if (policyLayers.isEmpty) throw ArgumentError('policyLayers required');
  }

  int selectAction(List<double> state) {
    final logits = policy.predict([state])[0];
    // softmax
    final maxLogit = logits.reduce(max);
    final exps = logits.map((l) => exp(l - maxLogit)).toList();
    final sum = exps.reduce((a, b) => a + b);
    final probs = exps.map((e) => e / sum).toList();
    double r = _rand.nextDouble();
    double cum = 0.0;
    for (var i = 0; i < probs.length; i++) {
      cum += probs[i];
      if (r < cum) return i;
    }
    return probs.length - 1;
  }

  /// Update from a single episode represented as lists of states, actions and returns.
  /// This method performs a simplistic parameter update by fitting the network
  /// towards the one-hot action probabilities scaled by returns.
  void updateFromEpisode(
    List<List<double>> states,
    List<int> actions,
    List<double> returns, {
    double lr = 0.01,
  }) {
    if (states.length != actions.length || actions.length != returns.length) {
      throw ArgumentError('episode lengths must match');
    }
    final xs = <List<double>>[];
    final ys = <List<double>>[];
    for (var i = 0; i < states.length; i++) {
      final s = states[i];
      final a = actions[i];
      final r = returns[i];
      // build a target vector where the taken action is scaled by the return
      final target = List<double>.filled(nActions, 0.0);
      target[a] = r;
      xs.add(s);
      ys.add(target);
    }
    // policy.fit doesn't accept a direct lr override; recreate a temporary
    // policy with the desired lr if strict control is required by callers.
    policy.fit(xs, ys);
  }

  Map<String, dynamic> toMap() => {
    'nActions': nActions,
    'policy': policy.toMap(),
  };
  static PolicyGradient fromMap(Map<String, dynamic> m, {int? seed}) {
    final pol = ANN.fromMap(m['policy'] as Map<String, dynamic>, seed: seed);
    final model = PolicyGradient(
      nActions: m['nActions'] as int,
      policyLayers: pol.layers,
      seed: seed,
    );
    model.policy.applyParamsFrom(pol);
    return model;
  }

  String toJson() => jsonEncode(toMap());
  static PolicyGradient fromJson(String s, {int? seed}) =>
      fromMap(jsonDecode(s) as Map<String, dynamic>, seed: seed);
}
