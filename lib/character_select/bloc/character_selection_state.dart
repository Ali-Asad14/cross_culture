part of 'character_selection_bloc.dart';

class CharacterSelectionState extends Equatable {
  const CharacterSelectionState({
    this.avatar = '',
    this.name = '',
    this.isValid = false,
  });

  final String avatar;
  final String name;
  final bool isValid;

  CharacterSelectionState copyWith({String? avatar, String? name}) {
    final updatedAvatar = avatar ?? this.avatar;
    final updatedName = name ?? this.name;
    return CharacterSelectionState(
      avatar: updatedAvatar,
      name: updatedName,
      isValid: updatedAvatar.isNotEmpty && updatedName.isNotEmpty,
    );
  }

  @override
  List<Object> get props => [
    avatar,
    name,
    isValid,
  ];
}
