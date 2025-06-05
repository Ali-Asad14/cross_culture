import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'character_selection_event.dart';
part 'character_selection_state.dart';

class CharacterSelectionBloc
    extends Bloc<CharacterSelectionEvent, CharacterSelectionState> {
  CharacterSelectionBloc() : super(const CharacterSelectionState()) {
    on<SelectAvatar>((event, emit) {
      emit(state.copyWith(avatar: event.avatar));
    });

    on<EnterName>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<SavePlayerData>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('player_name', state.name);
      await prefs.setString('player_avatar', state.avatar);
    });

    on<LoadPlayerData>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final name = prefs.getString('player_name') ?? '';
      final avatar = prefs.getString('player_avatar') ?? '';
      emit(state.copyWith(name: name, avatar: avatar));
    });
  }
}
