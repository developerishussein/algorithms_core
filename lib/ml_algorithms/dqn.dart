/// Deep Q-Network (DQN) - minimal numeric example
///
/// A compact DQN wrapper that uses the project's `ANN` MLP as a function
/// approximator. This implementation is intentionally small and educational —
/// it demonstrates replay memory, epsilon-greedy actions, and periodic updates
/// so it can be used in examples and unit tests without GPU dependencies.
///
/// Notes:
/// - States are represented as List<double> feature vectors
/// - Actions are integer indices
library;

import 'dart:convert';
import 'dart:math';
import 'package:algorithms_core/ml_algorithms/ann.dart';

class DQN {
  final int nActions;
  final ANN network;
  final int memoryCapacity;
  final Random _rand;
  final List<List<double>> _states = [];
  final List<int> _actions = [];
  final List<double> _rewards = [];
  final List<List<double>> _nextStates = [];

  double epsilon;

  DQN({
    required this.nActions,
    required List<int> netLayers,
    this.memoryCapacity = 1000,
    this.epsilon = 0.1,
    int? seed,
  }) : _rand = seed != null ? Random(seed) : Random(),
       network = ANN(layers: netLayers, seed: seed) {
    if (netLayers.isEmpty) throw ArgumentError('netLayers required');
  }

  int chooseAction(List<double> state) {
    if (_rand.nextDouble() < epsilon) return _rand.nextInt(nActions);
    final pred = network.predict([state]);
    final row = pred[0];
    double best = row[0];
    int bestIdx = 0;
    for (var i = 1; i < row.length; i++) {
      if (row[i] > best) {
        best = row[i];
        bestIdx = i;
      }
    }
    return bestIdx;
  }

  void remember(
    List<double> state,
    int action,
    double reward,
    List<double> nextState,
  ) {
    if (_states.length >= memoryCapacity) {
      _states.removeAt(0);
      _actions.removeAt(0);
      _rewards.removeAt(0);
      _nextStates.removeAt(0);
    }
    _states.add(state);
    _actions.add(action);
    _rewards.add(reward);
    _nextStates.add(nextState);
  }

  void replay({int batchSize = 16}) {
    if (_states.isEmpty) return;
    final b = min(batchSize, _states.length);
    final idxs = List<int>.generate(_states.length, (i) => i);
    idxs.shuffle(_rand);
    final batchIdx = idxs.sublist(0, b);
    final xs = <List<double>>[];
    final ys = <List<double>>[];
    for (var i in batchIdx) {
      final s = _states[i];
      final a = _actions[i];
      final r = _rewards[i];
      final ns = _nextStates[i];
      final q = network.predict([s])[0];
      final qNext = network.predict([ns])[0];
      final target = List<double>.from(q);
      final maxNext = qNext.reduce((x, y) => x > y ? x : y);
      target[a] = r + 0.99 * maxNext;
      xs.add(s);
      ys.add(target);
    }
    network.fit(xs, ys);
  }

  Map<String, dynamic> toMap() => {
    'nActions': nActions,
    'epsilon': epsilon,
    'network': network.toMap(),
  };
  static DQN fromMap(Map<String, dynamic> m, {int? seed}) {
    final net = ANN.fromMap(m['network'] as Map<String, dynamic>, seed: seed);
    final model = DQN(
      nActions: m['nActions'] as int,
      netLayers: net.layers,
      memoryCapacity: 1000,
      epsilon: (m['epsilon'] as num).toDouble(),
      seed: seed,
    );
    model.network.applyParamsFrom(net);
    return model;
  }

  String toJson() => jsonEncode(toMap());
  static DQN fromJson(String s, {int? seed}) =>
      fromMap(jsonDecode(s) as Map<String, dynamic>, seed: seed);
}
