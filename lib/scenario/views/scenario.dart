// ignore_for_file: lines_longer_than_80_chars

import 'package:cross_culture/models/scenario.dart';
import 'package:cross_culture/scenario/bloc/scenario_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScenarioPage extends StatelessWidget {
  const ScenarioPage({required this.scenarioId, super.key});

  final int scenarioId;

  @override
  Widget build(BuildContext context) {
    final allScenarios = [
      // Scenario 1: Arrival in Islamabad
      const Scenario(
        id: 1,
        title: 'Arrival in Islamabad',
        description:
            "You arrive in Islamabad, Pakistan’s capital, to explore business and cultural opportunities. A local guide, Mr. Yusuf, greets you with 'As-salamu alaykum' and a handshake. How do you respond?",
        choices: [
          ScenarioChoice(
            label: 'Smile and nod',
            detail: 'You nod politely, unsure of the greeting.',
            trustChange: -5,
            cultureChange: -5,
            businessChange: -5,
            nextScenarioId: 3,
          ),
          ScenarioChoice(
            label: 'Return greeting',
            detail: "You say 'Wa alaykumu s-salam' and shake hands.",
            trustChange: 10,
            cultureChange: 10,
            businessChange: 5,
            nextScenarioId: 2,
          ),
          ScenarioChoice(
            label: 'Hug warmly',
            detail: 'You go for a friendly hug.',
            trustChange: -10,
            cultureChange: -10,
            businessChange: -5,
            nextScenarioId: 3,
          ),
        ],
      ),

      // Scenario 2: Textile Meeting in Lahore
      const Scenario(
        id: 2,
        title: 'Textile Meeting in Lahore',
        description:
            'Your polite greeting leads to a textile business meeting in Lahore with Mrs. Sana. She values respect and patience. How do you approach the meeting?',
        choices: [
          ScenarioChoice(
            label: 'Talk politics',
            detail: 'You discuss politics to break the ice.',
            trustChange: -10,
            cultureChange: -10,
            businessChange: -5,
            nextScenarioId: 5,
          ),
          ScenarioChoice(
            label: 'Arrive early with gift',
            detail:
                "You arrive early, address her as 'Mrs. Sana,' and bring a small gift.",
            trustChange: 15,
            cultureChange: 10,
            businessChange: 10,
            nextScenarioId: 4,
          ),
          ScenarioChoice(
            label: 'Be casual',
            detail: 'You arrive on time and use her first name.',
            trustChange: -5,
            cultureChange: -5,
            nextScenarioId: 5,
          ),
        ],
      ),

      // Scenario 3: Tea Market in Karachi
      const Scenario(
        id: 3,
        title: 'Tea Market in Karachi',
        description:
            'Your hesitant greeting leads to a tea trading deal in Karachi. Mr. Bilal likes quick decisions but values relationships. How do you negotiate?',
        choices: [
          ScenarioChoice(
            label: 'Focus on profit',
            detail: 'You push for a fast, profitable deal.',
            trustChange: -5,
            cultureChange: -5,
            businessChange: 10,
            nextScenarioId: 5,
          ),
          ScenarioChoice(
            label: 'Decline the deal',
            detail: 'You back out, feeling unprepared.',
            trustChange: -10,
            cultureChange: -5,
            businessChange: -10,
            nextScenarioId: 6,
          ),
          ScenarioChoice(
            label: 'Build rapport',
            detail: 'You take time to connect with Mr. Bilal.',
            trustChange: 10,
            cultureChange: 10,
            businessChange: 5,
            nextScenarioId: 7,
          ),
        ],
      ),

      // Scenario 4: Hunza Valley Festival
      const Scenario(
        id: 4,
        title: 'Hunza Valley Festival',
        description:
            'Your respect in Lahore earns an invitation to a cultural festival in Hunza Valley. An elder invites you to join a traditional dance. How do you respond?',
        choices: [
          ScenarioChoice(
            label: 'Watch politely',
            detail: 'You observe respectfully without dancing.',
            trustChange: 5,
            cultureChange: 5,
            nextScenarioId: 8,
          ),
          ScenarioChoice(
            label: 'Leave early',
            detail: 'You leave, feeling uncomfortable.',
            trustChange: -10,
            cultureChange: -10,
            businessChange: -5,
            nextScenarioId: 6,
          ),
          ScenarioChoice(
            label: 'Join the dance',
            detail: 'You participate respectfully in the dance.',
            trustChange: 15,
            cultureChange: 15,
            businessChange: 5,
            nextScenarioId: 8,
          ),
        ],
      ),

      // Scenario 5: Renewable Energy in Islamabad
      const Scenario(
        id: 5,
        title: 'Renewable Energy in Islamabad',
        description:
            'Your approach leads to a renewable energy pitch in Islamabad. Officials value cultural respect. How do you present?',
        choices: [
          ScenarioChoice(
            label: 'Focus on profits',
            detail: 'You highlight financial benefits only.',
            trustChange: -5,
            cultureChange: -10,
            businessChange: 10,
            nextScenarioId: 9,
          ),
          ScenarioChoice(
            label: 'Emphasize sustainability',
            detail: 'You focus on eco-friendly benefits and local values.',
            trustChange: 10,
            cultureChange: 10,
            businessChange: 10,
            nextScenarioId: 10,
          ),
          ScenarioChoice(
            label: 'Generic pitch',
            detail: 'You give a standard presentation.',
            trustChange: -5,
            cultureChange: -5,
            businessChange: -5,
            nextScenarioId: 6,
          ),
        ],
      ),

      // Scenario 6: Misstep in Quetta
      const Scenario(
        id: 6,
        title: 'Misstep in Quetta',
        description:
            'Your mistakes lead to a meeting in Quetta. A local leader offers a chance to support a healthcare project. How do you respond?',
        choices: [
          ScenarioChoice(
            label: 'Engage humbly',
            detail: 'You apologize and commit to the project.',
            trustChange: 15,
            cultureChange: 15,
            businessChange: 5,
            nextScenarioId: 10,
          ),
          ScenarioChoice(
            label: 'Decline politely',
            detail: 'You refuse, citing other priorities.',
            trustChange: -10,
            cultureChange: -10,
            businessChange: -5,
            nextScenarioId: 11,
          ),
          ScenarioChoice(
            label: 'Offer minimal help',
            detail: 'You provide limited support.',
            trustChange: -5,
            cultureChange: -5,
            nextScenarioId: 11,
          ),
        ],
      ),

      // Scenario 7: Rice Export in Punjab
      const Scenario(
        id: 7,
        title: 'Rice Export in Punjab',
        description:
            'Your balanced approach leads to a rice export deal in Punjab. Locals value fair negotiations. How do you proceed?',
        choices: [
          ScenarioChoice(
            label: 'Push for profit',
            detail: 'You demand high profits.',
            trustChange: -10,
            cultureChange: -10,
            businessChange: 15,
            nextScenarioId: 9,
          ),
          ScenarioChoice(
            label: 'Build relationships',
            detail: 'You offer fair terms and respect local customs.',
            trustChange: 10,
            cultureChange: 10,
            businessChange: 10,
            nextScenarioId: 10,
          ),
          ScenarioChoice(
            label: 'Withdraw',
            detail: 'You back out, sensing challenges.',
            trustChange: -5,
            cultureChange: -5,
            businessChange: -10,
            nextScenarioId: 11,
          ),
        ],
      ),

      // Scenario 8: Tourism in Skardu
      const Scenario(
        id: 8,
        title: 'Tourism in Skardu',
        description:
            'Your respect in Hunza leads to a tourism project in Skardu. Locals value environmental care. How do you proceed?',
        choices: [
          ScenarioChoice(
            label: 'Propose resorts',
            detail: 'You suggest large-scale resorts.',
            trustChange: -10,
            cultureChange: -10,
            businessChange: 15,
            nextScenarioId: 9,
          ),
          ScenarioChoice(
            label: 'Suggest eco-tourism',
            detail: 'You propose sustainable tourism.',
            trustChange: 15,
            cultureChange: 15,
            businessChange: 10,
            nextScenarioId: 12,
          ),
          ScenarioChoice(
            label: 'Ask locals',
            detail: 'You seek community input.',
            trustChange: 5,
            cultureChange: 5,
            nextScenarioId: 12,
            condition: {'trust': 15},
          ),
        ],
      ),

      // Scenario 9: Investor Pitch in Karachi
      const Scenario(
        id: 9,
        title: 'Investor Pitch in Karachi',
        description:
            'Your business focus leads to a renewable energy pitch in Karachi. Your profit-driven approach has mixed results. How do you pitch?',
        choices: [
          ScenarioChoice(
            label: 'Include cultural respect',
            detail: 'You balance business with cultural respect.',
            trustChange: 10,
            cultureChange: 10,
            businessChange: 10,
            nextScenarioId: 12,
          ),
          ScenarioChoice(
            label: 'Focus on profits',
            detail: 'You highlight financial gains.',
            trustChange: -10,
            cultureChange: -10,
            businessChange: 15,
            nextScenarioId: 13,
          ),
          ScenarioChoice(
            label: 'Hurry the pitch',
            detail: 'You rush with a profit-focused pitch.',
            trustChange: -15,
            cultureChange: -15,
            businessChange: 5,
            nextScenarioId: 11,
          ),
        ],
      ),

      // Scenario 10: Education Project in Swat
      const Scenario(
        id: 10,
        title: 'Education Project in Swat',
        description:
            'Your efforts lead to an education project in Swat Valley. Locals value community involvement. How do you engage?',
        choices: [
          ScenarioChoice(
            label: 'Focus on goals',
            detail: 'You prioritize project outcomes.',
            trustChange: -5,
            cultureChange: -5,
            businessChange: 5,
            nextScenarioId: 11,
          ),
          ScenarioChoice(
            label: 'Work with locals',
            detail: 'You learn basic greetings and collaborate.',
            trustChange: 15,
            cultureChange: 15,
            businessChange: 5,
            nextScenarioId: 12,
          ),
          ScenarioChoice(
            label: 'Let locals lead',
            detail: 'You let locals guide the project.',
            trustChange: 5,
            cultureChange: 5,
            nextScenarioId: 12,
            condition: {'trust': 15},
          ),
        ],
      ),

      // Scenario 11: Setback in Balochistan
      const Scenario(
        id: 11,
        title: 'Setback in Balochistan',
        description:
            'Your missteps lead to a meeting in Balochistan. An elder offers a chance to support an education project. How do you respond?',
        choices: [
          ScenarioChoice(
            label: 'Commit humbly',
            detail: 'You apologize and join the project.',
            trustChange: 15,
            cultureChange: 15,
            businessChange: 5,
            nextScenarioId: 12,
          ),
          ScenarioChoice(
            label: 'Offer little help',
            detail: 'You provide minimal support.',
            trustChange: -5,
            cultureChange: -5,
            nextScenarioId: 13,
          ),
          ScenarioChoice(
            label: 'Decline',
            detail: 'You refuse and leave.',
            trustChange: -15,
            cultureChange: -15,
            businessChange: -10,
            nextScenarioId: 13,
          ),
        ],
      ),

      // Scenario 12: Cultural Exchange in Gilgit
      const Scenario(
        id: 12,
        title: 'Cultural Exchange in Gilgit',
        description:
            'Your respect earns a meeting in Gilgit to propose a cultural exchange program. Locals value their heritage. What do you propose?',
        choices: [
          ScenarioChoice(
            label: 'Heritage festival',
            detail: 'You suggest a festival celebrating local cultures.',
            trustChange: 15,
            cultureChange: 15,
            businessChange: 10,
            nextScenarioId: 14,
          ),
          ScenarioChoice(
            label: 'Trade expo',
            detail: 'You propose a business-focused expo.',
            cultureChange: -5,
            businessChange: 10,
            nextScenarioId: 13,
          ),
          ScenarioChoice(
            label: 'Work with locals',
            detail: 'You collaborate with local leaders.',
            trustChange: 10,
            cultureChange: 10,
            businessChange: 5,
            nextScenarioId: 14,
            condition: {'trust': 20},
          ),
        ],
      ),

      // Scenario 13: Trade Summit in Punjab
      const Scenario(
        id: 13,
        title: 'Trade Summit in Punjab',
        description:
            'Your business focus leads to a cotton trade summit in Punjab. Your profit-driven approach has caused some tension. How do you present?',
        choices: [
          ScenarioChoice(
            label: 'Emphasize profits',
            detail: 'You focus on financial success.',
            trustChange: -10,
            cultureChange: -10,
            businessChange: 15,
            nextScenarioId: 15,
          ),
          ScenarioChoice(
            label: 'Balance business and culture',
            detail: 'You respect local values while discussing business.',
            trustChange: 10,
            cultureChange: 10,
            businessChange: 10,
            nextScenarioId: 14,
          ),
          ScenarioChoice(
            label: 'Let locals lead',
            detail: 'You let a local partner lead.',
            businessChange: 5,
            nextScenarioId: 15,
            condition: {'business': 20},
          ),
        ],
      ),

      // Scenario 14: Tourism in Chitral
      const Scenario(
        id: 14,
        title: 'Tourism in Chitral',
        description:
            'Your efforts lead to a meeting in Chitral to promote adventure tourism. The community values environmental care. How do you approach?',
        choices: [
          ScenarioChoice(
            label: 'Propose eco-tourism',
            detail: 'You suggest sustainable trekking routes.',
            trustChange: 15,
            cultureChange: 15,
            businessChange: 10,
            nextScenarioId: 15,
          ),
          ScenarioChoice(
            label: 'Push for resorts',
            detail: 'You propose large tourism facilities.',
            trustChange: -10,
            cultureChange: -10,
            businessChange: 15,
            nextScenarioId: 15,
          ),
          ScenarioChoice(
            label: 'Consult locals',
            detail: 'You seek community input.',
            trustChange: 10,
            cultureChange: 10,
            businessChange: 5,
            nextScenarioId: 15,
            condition: {'trust': 25},
          ),
        ],
      ),

      // Scenario 15: National Legacy in Islamabad
      const Scenario(
        id: 15,
        title: 'National Legacy in Islamabad',
        description:
            'At a national summit in Islamabad, your journey in Pakistan is reviewed. Your actions shape your legacy. How do you conclude?',
        choices: [
          ScenarioChoice(
            label: 'Highlight business success',
            detail: 'You focus on business achievements.',
            cultureChange: -10,
            businessChange: 15,
          ),
          ScenarioChoice(
            label: 'Celebrate cultural ties',
            detail: 'You emphasize cultural respect and partnerships.',
            trustChange: 15,
            cultureChange: 15,
            businessChange: 10,
          ),
          ScenarioChoice(
            label: 'Admit mistakes',
            detail: 'You acknowledge your missteps.',
            trustChange: -5,
            cultureChange: -5,
            businessChange: -5,
          ),
        ],
      ),
    ];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ScenarioBloc>().add(const LoadScoreFromPreferences());
    });

    final scenario = allScenarios.isNotEmpty
        ? allScenarios.firstWhere(
            (s) => s.id == scenarioId,
            orElse: () => allScenarios.first,
          )
        : null;
    if (scenario == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('No scenarios available')),
      );
    }
    final scores = context.watch<ScenarioBloc>().state;
    final theme = Theme.of(context);

    final currentTrust = scores.trustScore;
    final currentCulture = scores.culturalAwarenessScore;
    final currentBusiness = scores.businessScore;

    final visibleChoices = scenario.choices.where((choice) {
      final condition = choice.condition;
      if (condition == null) return true;

      final trustOk =
          condition['trust'] == null || currentTrust >= condition['trust']!;
      final cultureOk = condition['culture'] == null ||
          currentCulture >= condition['culture']!;
      final businessOk = condition['business'] == null ||
          currentBusiness >= condition['business']!;
      return trustOk && cultureOk && businessOk;
    }).toList();

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scenario ${scenario.id}'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Score Display
                Card(
                  color: theme.cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _scoreItem('Trust', currentTrust),
                        _scoreItem('Culture', currentCulture),
                        _scoreItem('Business', currentBusiness),
                      ],
                    ),
                  ),
                ),

                Text(
                  scenario.title,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  scenario.description,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),

                // Choices
                if (visibleChoices.isEmpty)
                  Center(
                    child: Text(
                      'No available choices right now.',
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(color: Colors.grey),
                    ),
                  )
                else
                  ...List.generate(visibleChoices.length, (index) {
                    final choice = visibleChoices[index];
                    return GestureDetector(
                      onTap: () {
                        context.read<ScenarioBloc>().add(
                              ApplyChoiceScores(
                                trust: choice.trustChange,
                                culture: choice.cultureChange,
                                business: choice.businessChange,
                              ),
                            );

                        final nextId =
                            choice.nextScenarioId ?? (scenario.id + 1);
                        if (allScenarios.any((s) => s.id == nextId)) {
                          context.go('/scenario/$nextId');
                        } else {
                          context.go('/summary');
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: theme.colorScheme.primary.withOpacity(0.3),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                choice.label,
                                style: theme.textTheme.labelLarge,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                choice.detail,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _scoreItem(String label, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
