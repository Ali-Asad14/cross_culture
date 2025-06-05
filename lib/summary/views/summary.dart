// ignore_for_file: lines_longer_than_80_chars

import 'package:cross_culture/character_select/bloc/character_selection_bloc.dart';
import 'package:cross_culture/character_select/views/character_selection.dart';
import 'package:cross_culture/scenario/bloc/scenario_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final player = context.watch<CharacterSelectionBloc>().state;
    final scores = context.watch<ScenarioBloc>().state;
    final theme = Theme.of(context);

    String getPersona() {
      if (scores.trustScore >= 30 && scores.culturalAwarenessScore >= 20) {
        return '🤝 The Bridge Builder\nYou built trust and embraced culture. People remember you.';
      } else if (scores.businessScore >= 30) {
        return '📊 The Deal Closer\nYou kept your eye on the numbers. Results matter.';
      } else if (scores.culturalAwarenessScore >= 30) {
        return '🕌 The Cultural Explorer\nYou connected deeply with the people and their traditions.';
      } else {
        return '🌐 The Observer\nYou walked the path, but held back. A learner, not yet a leader.';
      }
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF2EFE9), Color(0xFFE3D5C0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🎉 Journey Complete!',
              style: theme.textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'Great work, ${player.name}!',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 20),

            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                availableAvatars[int.parse(player.avatar)],
              ),
            ),

            const SizedBox(height: 24),

            // Score breakdown
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                child: Column(
                  children: [
                    Text('Your Final Score',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _scoreItem('Trust', scores.trustScore),
                        _scoreItem('Culture', scores.culturalAwarenessScore),
                        _scoreItem('Business', scores.businessScore),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Persona
            Text(
              getPersona(),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18),
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.refresh),
              label: const Text('Play Again'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                textStyle: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _scoreItem(String label, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
