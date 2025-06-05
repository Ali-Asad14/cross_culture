// ignore_for_file: lines_longer_than_80_chars

import 'package:cross_culture/models/scenario.dart';
import 'package:cross_culture/scenario/bloc/scenario_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final List<Scenario> allScenarios = [
  // Scenario 1: Arrival in Islamabad
  const Scenario(
    id: 1,
    title: 'Arrival in Islamabad',
    description:
        "You land in Islamabad, Pakistan’s capital, to explore business and cultural opportunities. A local guide, Mr. Yusuf, greets you with 'As-salamu alaykum' and a handshake (Greeting Culture). Your response shapes your journey. How do you reply?",
    choices: [
      ScenarioChoice(
        label: 'Smile and nod silently',
        detail: 'You nod politely, unsure of the proper greeting.',
        trustChange: -5,
        cultureChange: -5,
        businessChange: -5,
        nextScenarioId: 3,
      ),
      ScenarioChoice(
        label: 'Return greeting and handshake',
        detail:
            "You say 'Wa alaykumu s-salam' and shake hands firmly, respecting local customs.",
        trustChange: 10,
        cultureChange: 10,
        businessChange: 5,
        nextScenarioId: 2,
      ),
      ScenarioChoice(
        label: 'Attempt a hug',
        detail: 'You go for a friendly hug, assuming it’s universal.',
        trustChange: -10,
        cultureChange: -10,
        businessChange: -10,
        nextScenarioId: 3,
      ),
    ],
  ),

  // Scenario 2: Textile Negotiation in Lahore (Trust/Culture Path)
  const Scenario(
    id: 2,
    title: 'Textile Negotiation in Lahore',
    description:
        r'Your respectful greeting earns a meeting in Lahore with Mrs. Sana, a textile exporter ($4.07B industry, Imports/Exports). She values hierarchy and patience (Hofstede: High Power Distance). How do you approach the meeting?',
    choices: [
      ScenarioChoice(
        label: 'Discuss politics',
        detail:
            'You bring up political topics to break the ice, ignoring do’s and don’ts.',
        trustChange: -15,
        cultureChange: -15,
        businessChange: -10,
        nextScenarioId: 6,
      ),
      ScenarioChoice(
        label: 'Arrive early with a gift',
        detail:
            "You arrive 15 minutes early, address her as 'Mrs. Sana,' and offer a culturally appropriate gift.",
        trustChange: 15,
        cultureChange: 10,
        businessChange: 10,
        nextScenarioId: 4,
      ),
      ScenarioChoice(
        label: 'Arrive on time, be informal',
        detail:
            'You arrive on time and use her first name, assuming familiarity.',
        trustChange: -5,
        cultureChange: -10,
        nextScenarioId: 5,
      ),
    ],
  ),

  // Scenario 3: Tea Market in Karachi (Business Path)
  const Scenario(
    id: 3,
    title: 'Tea Market in Karachi',
    description:
        r'Your hesitant greeting leads to a tea import deal in Karachi ($612M, Imports/Exports). Mr. Bilal, a trader, values quick decisions but respects relationships (Trompenaars: Specific vs. Diffuse). How do you negotiate?',
    choices: [
      ScenarioChoice(
        label: 'Push for quick profits',
        detail: 'You focus on maximizing margins with a fast deal.',
        trustChange: -5,
        cultureChange: -5,
        businessChange: 15,
        nextScenarioId: 6,
      ),
      ScenarioChoice(
        label: 'Decline the deal',
        detail: 'You opt out, citing lack of preparation.',
        trustChange: -10,
        cultureChange: -5,
        businessChange: -15,
        nextScenarioId: 7,
      ),
      ScenarioChoice(
        label: 'Build rapport first',
        detail:
            'You take time to connect with Mr. Bilal, balancing trust and business.',
        trustChange: 10,
        cultureChange: 10,
        businessChange: 5,
        nextScenarioId: 5,
      ),
    ],
  ),

  // Scenario 4: Hunza Valley Festival (Northern Areas, Trust/Culture Path)
  const Scenario(
    id: 4,
    title: 'Hunza Valley Festival',
    description:
        'Your respectful demeanor in Lahore earns an invitation to a Wakhi cultural festival in Hunza, Gilgit-Baltistan (Northern Areas, Geographic Overview). An elder invites you to join a traditional dance (Lewis: Multi-Active). How do you respond?',
    choices: [
      ScenarioChoice(
        label: 'Observe politely',
        detail: 'You watch respectfully, showing interest without dancing.',
        trustChange: 5,
        cultureChange: 5,
        nextScenarioId: 8,
      ),
      ScenarioChoice(
        label: 'Leave early',
        detail:
            'You exit the festival, citing discomfort with cultural events.',
        trustChange: -10,
        cultureChange: -10,
        businessChange: -5,
        nextScenarioId: 7,
      ),
      ScenarioChoice(
        label: 'Join the dance respectfully',
        detail: 'You participate enthusiastically, following Wakhi traditions.',
        trustChange: 15,
        cultureChange: 15,
        businessChange: 5,
        nextScenarioId: 8,
      ),
    ],
  ),

  // Scenario 5: Renewable Energy in Islamabad (Balanced Path)
  const Scenario(
    id: 5,
    title: 'Renewable Energy in Islamabad',
    description:
        'Your balanced approach leads to a renewable energy pitch in Islamabad (Market Potential). Officials expect cultural sensitivity (Hofstede: Collectivism). How do you present?',
    choices: [
      ScenarioChoice(
        label: 'Focus on financial returns',
        detail: 'You prioritize economic gains, downplaying cultural aspects.',
        trustChange: -5,
        cultureChange: -10,
        businessChange: 15,
        nextScenarioId: 6,
      ),
      ScenarioChoice(
        label: 'Emphasize sustainability and culture',
        detail:
            'You highlight eco-friendly benefits and respect for local values.',
        trustChange: 15,
        cultureChange: 10,
        businessChange: 10,
        nextScenarioId: 9,
      ),
      ScenarioChoice(
        label: 'Generic pitch',
        detail: 'You deliver a standard pitch, ignoring local context.',
        trustChange: -10,
        cultureChange: -10,
        businessChange: -5,
        nextScenarioId: 7,
      ),
    ],
  ),

  // Scenario 6: Rice Export in Punjab (Business Path)
  const Scenario(
    id: 6,
    title: 'Rice Export in Punjab',
    description:
        r'Your business focus leads to a rice export deal in Punjab ($2.47B, Imports/Exports). Your aggressive tactics have mixed reception (Trompenaars: Achievement vs. Ascription). How do you negotiate?',
    choices: [
      ScenarioChoice(
        label: 'Push for maximum profit',
        detail: 'You demand favorable terms, prioritizing profit.',
        trustChange: -15,
        cultureChange: -15,
        businessChange: 15,
        nextScenarioId: 11,
      ),
      ScenarioChoice(
        label: 'Withdraw from deal',
        detail: 'You back out, sensing resistance.',
        trustChange: -10,
        cultureChange: -10,
        businessChange: -15,
        nextScenarioId: 7,
      ),
      ScenarioChoice(
        label: 'Shift to relationship-building',
        detail: 'You offer fair terms, respecting local hierarchy.',
        trustChange: 10,
        cultureChange: 10,
        businessChange: 10,
        nextScenarioId: 10,
      ),
    ],
  ),

  // Scenario 7: Failure in Quetta (Failure Path)
  const Scenario(
    id: 7,
    title: 'Failure in Quetta',
    description:
        'Your missteps land you in Quetta with a tarnished reputation (3% Balochi, Geographic Overview). A leader offers a chance to support a healthcare initiative (Market Potential). How do you respond?',
    choices: [
      ScenarioChoice(
        label: 'Engage humbly and learn',
        detail:
            'You apologize, learn Balochi greetings, and commit to the initiative.',
        trustChange: 15,
        cultureChange: 15,
        businessChange: 5,
        nextScenarioId: 10,
      ),
      ScenarioChoice(
        label: 'Decline to participate',
        detail: 'You refuse, prioritizing other commitments.',
        trustChange: -15,
        cultureChange: -15,
        businessChange: -10,
        nextScenarioId: 12,
      ),
      ScenarioChoice(
        label: 'Offer minimal support',
        detail: 'You provide limited help, focusing on damage control.',
        nextScenarioId: 12,
      ),
    ],
  ),

  // Scenario 8: Tourism in Skardu (Northern Areas, Trust/Culture Path)
  const Scenario(
    id: 8,
    title: 'Tourism in Skardu',
    description:
        r'Your cultural respect in Hunza leads to a tourism project in Skardu, Gilgit-Baltistan, a hub for mountaineering tourism ($5.53B potential, Market Potential). Locals value environmental preservation (Lewis: Reactive). How do you proceed?',
    choices: [
      ScenarioChoice(
        label: 'Push for large-scale resorts',
        detail: 'You propose major resorts to capitalize on tourism growth.',
        trustChange: -10,
        cultureChange: -10,
        businessChange: 15,
        nextScenarioId: 11,
      ),
      ScenarioChoice(
        label: 'Propose eco-tourism',
        detail:
            'You suggest sustainable tourism to preserve Skardu’s landscapes.',
        trustChange: 15,
        cultureChange: 15,
        businessChange: 10,
        nextScenarioId: 13,
      ),
      ScenarioChoice(
        label: 'Seek local input',
        detail:
            'You ask for community guidance, delaying action but showing respect.',
        trustChange: 5,
        cultureChange: 5,
        nextScenarioId: 13,
        condition: {'trust': 20},
      ),
    ],
  ),

  // Scenario 9: Indus Valley Heritage (Trust/Culture Path)
  const Scenario(
    id: 9,
    title: 'Indus Valley Heritage',
    description:
        'Your balanced approach leads to a tour of the Indus Valley Civilization sites (Historical Background). A historian asks your stance on preservation (Hofstede: Long-Term Orientation). What do you say?',
    choices: [
      ScenarioChoice(
        label: 'Remain neutral',
        detail: 'You avoid taking a stance, citing lack of expertise.',
        trustChange: -5,
        cultureChange: -5,
        businessChange: -5,
        nextScenarioId: 12,
      ),
      ScenarioChoice(
        label: 'Advocate for preservation',
        detail:
            'You support preserving the sites for their global historical value.',
        trustChange: 15,
        cultureChange: 15,
        businessChange: 5,
        nextScenarioId: 13,
      ),
      ScenarioChoice(
        label: 'Propose tourism development',
        detail: 'You suggest developing the sites for tourism revenue.',
        cultureChange: -5,
        businessChange: 10,
        nextScenarioId: 10,
      ),
    ],
  ),

  // Scenario 10: Education Project in Swat (Northern Areas, Balanced Path)
  const Scenario(
    id: 10,
    title: 'Education Project in Swat',
    description:
        'Your reputation leads to a meeting in Swat Valley, KPK, to support an education initiative (Market Potential, 18.2% Pashto speakers). Locals value community involvement (Hofstede: Collectivism). How do you engage?',
    choices: [
      ScenarioChoice(
        label: 'Focus on project goals',
        detail:
            'You prioritize outcomes, using English and minimal cultural engagement.',
        trustChange: -5,
        cultureChange: -10,
        businessChange: 5,
        nextScenarioId: 11,
      ),
      ScenarioChoice(
        label: 'Learn Pashto and collaborate',
        detail: 'You learn basic Pashto greetings and work with elders.',
        trustChange: 15,
        cultureChange: 15,
        businessChange: 5,
        nextScenarioId: 13,
      ),
      ScenarioChoice(
        label: 'Delegate to locals',
        detail: 'You let locals lead, hoping to avoid cultural missteps.',
        nextScenarioId: 12,
        condition: {'trust': 20},
      ),
    ],
  ),

  // Scenario 11: Investor Pitch in Karachi (Business Path)
  const Scenario(
    id: 11,
    title: 'Investor Pitch in Karachi',
    description:
        'Your profit-driven approach leads to a renewable energy pitch in Karachi (Market Potential). Your focus on business has distanced locals (Lewis: Linear-Active). How do you pitch?',
    choices: [
      ScenarioChoice(
        label: 'Incorporate cultural values',
        detail: 'You balance economic goals with respect for local heritage.',
        trustChange: 10,
        cultureChange: 10,
        businessChange: 10,
        nextScenarioId: 13,
      ),
      ScenarioChoice(
        label: 'Emphasize economic benefits',
        detail: 'You highlight financial returns, appealing to investors.',
        trustChange: -10,
        cultureChange: -10,
        businessChange: 20,
        nextScenarioId: 14,
      ),
      ScenarioChoice(
        label: 'Rush the pitch',
        detail: 'You deliver a hurried, profit-focused pitch.',
        trustChange: -15,
        cultureChange: -15,
        businessChange: 5,
        nextScenarioId: 12,
      ),
    ],
  ),

  // Scenario 12: Community Misstep in KPK (Failure Path)
  const Scenario(
    id: 12,
    title: 'Community Misstep in KPK',
    description:
        'Your inconsistent actions strain a meeting in KPK with a Pashto community (18.2% Pashto, Geographic Overview). They question your commitment to a healthcare project (Market Potential). How do you respond?',
    choices: [
      ScenarioChoice(
        label: 'Use English and focus on goals',
        detail: 'You prioritize project outcomes, using English.',
        trustChange: -5,
        cultureChange: -10,
        nextScenarioId: 14,
      ),
      ScenarioChoice(
        label: 'Learn Pashto and engage',
        detail: 'You learn basic Pashto greetings and engage respectfully.',
        trustChange: 15,
        cultureChange: 15,
        businessChange: 5,
        nextScenarioId: 13,
      ),
      ScenarioChoice(
        label: 'Avoid engagement',
        detail: 'You minimize interaction, unsure how to connect.',
        trustChange: -15,
        cultureChange: -15,
        businessChange: -10,
        nextScenarioId: 15,
      ),
    ],
  ),

  // Scenario 13: Cultural Exchange in Gilgit (Northern Areas, Trust/Culture Path)
  const Scenario(
    id: 13,
    title: 'Cultural Exchange in Gilgit',
    description:
        'Your cultural respect earns a meeting in Gilgit to propose a cultural exchange program (Northern Areas, Geographic Overview). Locals value heritage (Hofstede: Long-Term Orientation). What do you propose?',
    choices: [
      ScenarioChoice(
        label: 'Propose a heritage festival',
        detail: 'You suggest a festival showcasing Shina and Balti cultures.',
        trustChange: 20,
        cultureChange: 20,
        businessChange: 10,
        nextScenarioId: 16,
      ),
      ScenarioChoice(
        label: 'Suggest a trade expo',
        detail:
            'You propose a business-focused expo, prioritizing economic ties.',
        cultureChange: -5,
        businessChange: 15,
        nextScenarioId: 14,
      ),
      ScenarioChoice(
        label: 'Collaborate with locals',
        detail: 'You work with local leaders to design the program.',
        trustChange: 10,
        cultureChange: 10,
        businessChange: 5,
        nextScenarioId: 16,
        condition: {'trust': 30, 'culture': 20},
      ),
    ],
  ),

  // Scenario 14: Trade Summit in Punjab (Business Path)
  const Scenario(
    id: 14,
    title: 'Trade Summit in Punjab',
    description:
        r'Your business success leads to a trade summit in Punjab for cotton exports ($4.07B, Imports/Exports). Your profit focus has strained relationships (Trompenaars: Specific vs. Diffuse). How do you present?',
    choices: [
      ScenarioChoice(
        label: 'Highlight economic success',
        detail: 'You emphasize financial achievements, appealing to investors.',
        trustChange: -10,
        cultureChange: -10,
        businessChange: 20,
        nextScenarioId: 17,
      ),
      ScenarioChoice(
        label: 'Delegate to a local partner',
        detail: 'You let a local lead, hoping to mitigate tensions.',
        businessChange: 5,
        nextScenarioId: 15,
        condition: {'business': 30},
      ),
      ScenarioChoice(
        label: 'Balance business and culture',
        detail:
            'You acknowledge cultural oversights and propose collaboration.',
        trustChange: 10,
        cultureChange: 10,
        businessChange: 10,
        nextScenarioId: 16,
      ),
    ],
  ),

  // Scenario 15: Isolation in Balochistan (Failure Path)
  const Scenario(
    id: 15,
    title: 'Isolation in Balochistan',
    description:
        'Your missteps leave you isolated in Quetta, Balochistan (3% Balochi, Geographic Overview). An elder offers a final chance to support an education project (Market Potential). How do you respond?',
    choices: [
      ScenarioChoice(
        label: 'Offer token support',
        detail: 'You provide minimal help, focusing on exiting gracefully.',
        nextScenarioId: 17,
      ),
      ScenarioChoice(
        label: 'Engage with humility',
        detail:
            'You apologize and commit to the project, learning local customs.',
        trustChange: 15,
        cultureChange: 15,
        businessChange: 5,
        nextScenarioId: 16,
      ),
      ScenarioChoice(
        label: 'Decline and leave',
        detail: 'You refuse, cementing your isolation.',
        trustChange: -20,
        cultureChange: -20,
        businessChange: -15,
        nextScenarioId: 17,
      ),
    ],
  ),

  // Scenario 16: Adventure Tourism in Chitral (Northern Areas, Trust/Culture Path)
  const Scenario(
    id: 16,
    title: 'Adventure Tourism in Chitral',
    description:
        r'Your cultural efforts lead to a meeting in Chitral, KPK, to promote adventure tourism (Northern Areas, $5.53B potential). The Khowar-speaking community values environmental care (Lewis: Reactive). How do you approach?',
    choices: [
      ScenarioChoice(
        label: 'Consult local elders',
        detail: 'You seek elder input, prioritizing community values.',
        trustChange: 10,
        cultureChange: 10,
        businessChange: 5,
        nextScenarioId: 18,
        condition: {'trust': 40},
      ),
      ScenarioChoice(
        label: 'Promote sustainable tourism',
        detail:
            'You propose eco-friendly trekking routes, respecting Chitral’s landscapes.',
        trustChange: 15,
        cultureChange: 15,
        businessChange: 10,
        nextScenarioId: 18,
      ),
      ScenarioChoice(
        label: 'Push for infrastructure growth',
        detail: 'You advocate for large-scale tourism facilities.',
        trustChange: -10,
        cultureChange: -10,
        businessChange: 15,
        nextScenarioId: 17,
      ),
    ],
  ),

  // Scenario 17: Business Expo in Karachi (Business Path)
  const Scenario(
    id: 17,
    title: 'Business Expo in Karachi',
    description:
        r'Your business focus leads to a trade expo in Karachi for leather exports ($0.76B, Imports/Exports). Your profit-driven approach has distanced locals (Hofstede: Uncertainty Avoidance). How do you present?',
    choices: [
      ScenarioChoice(
        label: 'Incorporate cultural respect',
        detail: 'You balance business goals with cultural acknowledgment.',
        trustChange: 10,
        cultureChange: 10,
        businessChange: 10,
        nextScenarioId: 18,
      ),
      ScenarioChoice(
        label: 'Highlight financial gains',
        detail: 'You emphasize export profits, appealing to investors.',
        trustChange: -10,
        cultureChange: -10,
        businessChange: 20,
        nextScenarioId: 19,
      ),
      ScenarioChoice(
        label: 'Rush the presentation',
        detail: 'You deliver a hurried, profit-focused pitch.',
        trustChange: -15,
        cultureChange: -15,
        businessChange: 5,
        nextScenarioId: 19,
      ),
    ],
  ),

  // Scenario 18: Cultural Diplomacy in Lahore (Trust/Culture Path)
  const Scenario(
    id: 18,
    title: 'Cultural Diplomacy in Lahore',
    description:
        'Your cultural respect earns a diplomatic meeting in Lahore to propose a cultural exchange (Hofstede: Collectivism). Officials seek a program uniting Pakistan’s diversity. What do you propose?',
    choices: [
      ScenarioChoice(
        label: 'Propose a national festival',
        detail:
            'You suggest a festival celebrating Punjabi, Sindhi, and Northern cultures.',
        trustChange: 20,
        cultureChange: 20,
        businessChange: 10,
        nextScenarioId: 20,
      ),
      ScenarioChoice(
        label: 'Collaborate with locals',
        detail: 'You work with local leaders to design the program.',
        trustChange: 10,
        cultureChange: 10,
        businessChange: 5,
        nextScenarioId: 20,
        condition: {'trust': 50, 'culture': 40},
      ),
      ScenarioChoice(
        label: 'Suggest a trade-focused expo',
        detail: 'You propose an expo prioritizing economic ties.',
        cultureChange: -5,
        businessChange: 15,
        nextScenarioId: 19,
      ),
    ],
  ),

  // Scenario 19: Investor Summit in Islamabad (Business Path)
  const Scenario(
    id: 19,
    title: 'Investor Summit in Islamabad',
    description:
        'Your business success leads to an investor summit in Islamabad for a tech startup (Market Potential). Your profit focus has strained cultural ties (Lewis: Linear-Active). How do you conclude?',
    choices: [
      ScenarioChoice(
        label: 'Balance business and culture',
        detail:
            'You acknowledge cultural oversights and propose collaboration.',
        trustChange: 10,
        cultureChange: 10,
        businessChange: 10,
        nextScenarioId: 20,
      ),
      ScenarioChoice(
        label: 'Emphasize economic success',
        detail:
            'You highlight financial achievements, securing investor support.',
        trustChange: -10,
        cultureChange: -10,
        businessChange: 20,
        nextScenarioId: 20,
      ),
      ScenarioChoice(
        label: 'Admit mistakes',
        detail: 'You apologize for neglecting cultural values.',
        trustChange: 15,
        cultureChange: 15,
        nextScenarioId: 20,
      ),
    ],
  ),

  // Scenario 20: National Legacy in Islamabad (Endings)
  const Scenario(
    id: 20,
    title: 'National Legacy in Islamabad',
    description:
        'At a national summit in Islamabad, your journey across Pakistan is evaluated (Hofstede: Uncertainty Avoidance). Your actions shape your legacy. How do you conclude your presentation? (Ending depends on scores.)',
    choices: [
      ScenarioChoice(
        label: 'Focus on economic achievements',
        detail:
            'You emphasize business successes, appealing to investors but distancing cultural advocates.',
        cultureChange: -10,
        businessChange: 20,
      ),
      ScenarioChoice(
        label: 'Celebrate cultural integration',
        detail:
            'You highlight your cultural understanding and partnerships, earning widespread respect.',
        trustChange: 20,
        cultureChange: 20,
        businessChange: 10,
      ),
      ScenarioChoice(
        label: 'Acknowledge failures',
        detail:
            'You admit cultural and relational missteps, leaving with limited influence.',
        trustChange: -5,
        cultureChange: -5,
        businessChange: -5,
      ),
    ],
  ),
];

class ScenarioPage extends StatelessWidget {
  const ScenarioPage({required this.scenarioId, super.key});

  final int scenarioId;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ScenarioBloc>().add(const LoadScoreFromPreferences());
    });

    final scenario = allScenarios.firstWhere(
      (s) => s.id == scenarioId,
      orElse: () => allScenarios.first,
    );
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
          child: Expanded(
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
                                color:
                                    theme.colorScheme.primary.withOpacity(0.3),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (choice.imageUrl != null)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(choice.imageUrl!),
                                    ),
                                  ),
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
