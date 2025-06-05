import 'package:cross_culture/character_select/bloc/character_selection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final availableAvatars = [
  'assets/avatars/male1.png',
  'assets/avatars/male2.png',
  'assets/avatars/male3.png',
  'assets/avatars/male4.png',
  'assets/avatars/male5.png',
  'assets/avatars/female1.png',
  'assets/avatars/female2.png',
  'assets/avatars/female3.png',
  'assets/avatars/female4.png',
  'assets/avatars/female5.png',
];

class CharacterSelectPage extends StatelessWidget {
  const CharacterSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final card = theme.cardColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Character'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<CharacterSelectionBloc, CharacterSelectionState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Pick an Avatar',
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      for (final avatar in availableAvatars)
                        _avatarTile(
                          context,
                          id: availableAvatars.indexOf(avatar).toString(),
                          asset: avatar,
                          selectedId: state.avatar,
                          cardColor: card,
                          highlightColor: primary,
                        ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Enter your name',
                        ),
                        onChanged: (value) => context
                            .read<CharacterSelectionBloc>()
                            .add(EnterName(name: value)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: SizedBox(
                      width: 120,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: state.isValid
                            ? () {
                                context
                                    .read<CharacterSelectionBloc>()
                                    .add(SavePlayerData());
                                context.go('/intro');
                              }
                            : null,
                        child: const Text('Continue'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _avatarTile(
    BuildContext context, {
    required String id,
    required String asset,
    required String selectedId,
    required Color cardColor,
    required Color highlightColor,
  }) {
    final isSelected = id == selectedId;

    return GestureDetector(
      onTap: () =>
          context.read<CharacterSelectionBloc>().add(SelectAvatar(avatar: id)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? highlightColor : Colors.transparent,
            width: 3,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          asset,
          height: 100,
        ),
      ),
    );
  }
}
