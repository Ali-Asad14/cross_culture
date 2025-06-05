part of 'scenario_bloc.dart';

sealed class ScenarioEvent extends Equatable {
  const ScenarioEvent();

  @override
  List<Object> get props => [];
}

class ApplyChoiceScores extends ScenarioEvent {
  const ApplyChoiceScores({
    required this.trust,
    required this.culture,
    required this.business,
  });
  final int trust;
  final int culture;
  final int business;

  @override
  List<Object> get props => [trust, culture, business];
}

class ResetScenarioState extends ScenarioEvent {}

class LoadScoreFromPreferences extends ScenarioEvent {
  const LoadScoreFromPreferences();

  @override
  List<Object> get props => [];
}

class ResetGameState extends ScenarioEvent {
  const ResetGameState();

  @override
  List<Object> get props => [];
}
