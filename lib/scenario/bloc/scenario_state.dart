part of 'scenario_bloc.dart';

class ScenarioState extends Equatable {
  const ScenarioState({
    this.trustScore = 0,
    this.culturalAwarenessScore = 0,
    this.businessScore = 0,
  });
  final int trustScore;
  final int culturalAwarenessScore;
  final int businessScore;

  ScenarioState copyWith({
    int? trustScore,
    int? culturalAwarenessScore,
    int? businessScore,
  }) {
    return ScenarioState(
      trustScore: trustScore ?? this.trustScore,
      culturalAwarenessScore:
          culturalAwarenessScore ?? this.culturalAwarenessScore,
      businessScore: businessScore ?? this.businessScore,
    );
  }

  @override
  List<Object> get props => [trustScore, culturalAwarenessScore, businessScore];
}
