/// SARSA (on-policy TD control)
///
/// Simple SARSA implementation for discrete state and action spaces. This
/// algorithm follows the on-policy update rule and exposes an epsilon-greedy
/// action selection. The API mirrors the tabular Q-Learning class so users can
/// swap algorithms easily in examples and tests.
///
/// Contract:
/// - states/actions: integers
/// - update(state, action, reward, nextState, nextAction)
library;

import 'dart:convert';
import 'dart:math';

class SARSA {
  final int nStates;
  final int nActions;
  final double alpha;
  final double gamma;
  double epsilon;
  final Random _rand;

  late List<List<double>> qTable;

  SARSA({
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

  void update(
    int state,
    int action,
    double reward,
    int nextState,
    int nextAction,
  ) {
    final q = qTable[state][action];
    final qNext = qTable[nextState][nextAction];
    qTable[state][action] = q + alpha * (reward + gamma * qNext - q);
  }

  Map<String, dynamic> toMap() => {
    'nStates': nStates,
    'nActions': nActions,
    'alpha': alpha,
    'gamma': gamma,
    'epsilon': epsilon,
    'qTable': qTable,
  };

  static SARSA fromMap(Map<String, dynamic> m, {int? seed}) {
    final model = SARSA(
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
  static SARSA fromJson(String s, {int? seed}) =>
      fromMap(jsonDecode(s) as Map<String, dynamic>, seed: seed);
}
