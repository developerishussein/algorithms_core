/// Q-Learning (tabular)
///
/// A compact, well-documented tabular Q-Learning implementation suitable for
/// discrete state/action spaces. This class intentionally keeps the API simple
/// (states and actions are integers) so it can be composed into larger agents
/// or used in unit tests and examples.
///
/// Public contract:
/// - Inputs: state (int), action (int), reward (double), nextState (int)
/// - Storage: internal Q-table of shape (nStates x nActions)
/// - Outputs: Q-values, action selection via epsilon-greedy
library;

import 'dart:convert';
import 'dart:math';

class QLearning {
  final int nStates;
  final int nActions;
  final double alpha; // learning rate
  final double gamma; // discount
  double epsilon; // exploration
  final Random _rand;

  late List<List<double>> qTable;

  QLearning({
    required this.nStates,
    required this.nActions,
    this.alpha = 0.1,
    this.gamma = 0.99,
    this.epsilon = 0.1,
    int? seed,
  }) : _rand = seed != null ? Random(seed) : Random() {
    if (nStates <= 0 || nActions <= 0) {
      throw ArgumentError('nStates and nActions must be > 0');
    }
    qTable = List.generate(nStates, (_) => List<double>.filled(nActions, 0.0));
  }

  int chooseAction(int state) {
    if (_rand.nextDouble() < epsilon) return _rand.nextInt(nActions);
    final row = qTable[state];
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

  void update(int state, int action, double reward, int nextState) {
    final q = qTable[state][action];
    final maxNext = qTable[nextState].reduce((a, b) => a > b ? a : b);
    qTable[state][action] = q + alpha * (reward + gamma * maxNext - q);
  }

  Map<String, dynamic> toMap() => {
    'nStates': nStates,
    'nActions': nActions,
    'alpha': alpha,
    'gamma': gamma,
    'epsilon': epsilon,
    'qTable': qTable,
  };

  static QLearning fromMap(Map<String, dynamic> m, {int? seed}) {
    final model = QLearning(
      nStates: m['nStates'] as int,
      nActions: m['nActions'] as int,
      alpha: (m['alpha'] as num).toDouble(),
      gamma: (m['gamma'] as num).toDouble(),
      epsilon: (m['epsilon'] as num).toDouble(),
      seed: seed,
    );
    final raw = m['qTable'] as List;
    model.qTable = raw.map((r) => List<double>.from(r as List)).toList();
    return model;
  }

  String toJson() => jsonEncode(toMap());
  static QLearning fromJson(String s, {int? seed}) =>
      fromMap(jsonDecode(s) as Map<String, dynamic>, seed: seed);
}
