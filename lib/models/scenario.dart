import 'package:equatable/equatable.dart';

class Scenario extends Equatable {
  const Scenario({
    required this.id,
    required this.title,
    required this.description,
    required this.choices,
  });
  final int id;
  final String title;
  final String description;
  final List<ScenarioChoice> choices;

  @override
  List<Object> get props => [id, title, description, choices];
}

class ScenarioChoice extends Equatable {
  const ScenarioChoice({
    required this.label,
    required this.detail,
    this.trustChange = 0,
    this.cultureChange = 0,
    this.businessChange = 0,
    this.nextScenarioId,
    this.condition,
  });
  final String label;
  final String detail;
  final int trustChange;
  final int cultureChange;
  final int businessChange;
  final int? nextScenarioId;
  final Map<String, int>? condition;

  @override
  List<Object?> get props => [
        label,
        detail,
        trustChange,
        cultureChange,
        businessChange,
        nextScenarioId,
        condition,
      ];
}
