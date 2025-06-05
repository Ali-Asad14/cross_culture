import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'scenario_event.dart';
part 'scenario_state.dart';

class ScenarioBloc extends Bloc<ScenarioEvent, ScenarioState> {
  ScenarioBloc() : super(const ScenarioState()) {
    on<ApplyChoiceScores>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();

      emit(
        state.copyWith(
          trustScore: state.trustScore + event.trust,
          culturalAwarenessScore: state.culturalAwarenessScore + event.culture,
          businessScore: state.businessScore + event.business,
        ),
      );
      await prefs.setInt('trust', state.trustScore);
      await prefs.setInt('culture', state.culturalAwarenessScore);
      await prefs.setInt('business', state.businessScore);
    });

    on<ResetScenarioState>((event, emit) {
      emit(const ScenarioState());
    });

    on<LoadScoreFromPreferences>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final trust = prefs.getInt('trust') ?? 0;
      final culture = prefs.getInt('culture') ?? 0;
      final business = prefs.getInt('business') ?? 0;

      emit(
        state.copyWith(
          trustScore: trust,
          culturalAwarenessScore: culture,
          businessScore: business,
        ),
      );
    });

    on<ResetGameState>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('trust');
      await prefs.remove('culture');
      await prefs.remove('business');

      emit(const ScenarioState());
    });
  }
}
