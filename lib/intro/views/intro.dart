// ignore_for_file: missing_whitespace_between_adjacent_strings, lines_longer_than_80_chars

import 'package:cross_culture/character_select/bloc/character_selection_bloc.dart';
import 'package:cross_culture/character_select/views/character_selection.dart';
import 'package:cross_culture/scenario/bloc/scenario_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CharacterSelectionBloc>().add(const LoadPlayerData());
    });

    final playerName =
        context.select((CharacterSelectionBloc bloc) => bloc.state.name);
    final playerAvatar =
        context.select((CharacterSelectionBloc bloc) => bloc.state.avatar);
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          // ✈️ Background Plane Animation
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Lottie.asset(
                'assets/animations/pakistan.json',
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),

          // Optional: Semi-transparent gradient overlay to darken the animation
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(150, 242, 239, 233), // F2EFE9 with opacity
                  Color.fromARGB(150, 227, 213, 192), // E3D5C0 with opacity
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // 📝 Foreground Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    availableAvatars[int.parse(playerAvatar)],
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  // 👋 Welcome Headline
                  Text(
                    'Welcome, $playerName!',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "You've arrived in Pakistan — a land of hospitality, tradition, and opportunity. "
                    'Your journey will take you through cultural lessons, historic landmarks, and business challenges.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {
                      // Reset the game state before starting the journey
                      context.read<ScenarioBloc>().add(
                            const ResetGameState(),
                          );
                      context.go('/scenario/0');
                    },
                    child: const Text('Begin Journey'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
