part of 'character_selection_bloc.dart';

sealed class CharacterSelectionEvent extends Equatable {
  const CharacterSelectionEvent();

  @override
  List<Object> get props => [];
}

class SelectAvatar extends CharacterSelectionEvent {
  const SelectAvatar({required this.avatar});
  final String avatar;

  @override
  List<Object> get props => [avatar];
}

class EnterName extends CharacterSelectionEvent {
  const EnterName({required this.name});
  final String name;

  @override
  List<Object> get props => [name];
}

class SavePlayerData extends CharacterSelectionEvent {}

class LoadPlayerData extends CharacterSelectionEvent {
  const LoadPlayerData();
}
