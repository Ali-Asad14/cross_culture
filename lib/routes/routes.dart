import 'package:cross_culture/character_select/bloc/character_selection_bloc.dart';
import 'package:cross_culture/character_select/views/character_selection.dart';
import 'package:cross_culture/intro/views/intro.dart';
import 'package:cross_culture/scenario/bloc/scenario_bloc.dart';
import 'package:cross_culture/scenario/views/scenario.dart';
import 'package:cross_culture/splash/splash.dart';
import 'package:cross_culture/summary/views/summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

/// AppRoutes
enum AppRoute {
  splash,
  characterSelect,
  intro,
  scenario,
  summary,
}

List<RouteBase> getAppRoutes(
  ObjectRef<GlobalKey<NavigatorState>> rootNavigatorKey,
) =>
    [
      ShellRoute(
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    CharacterSelectionBloc()..add(const LoadPlayerData()),
              ),
              BlocProvider(
                create: (context) => ScenarioBloc(),
              ),
            ],
            child: Scaffold(
              body: child,
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            name: AppRoute.splash.name,
            builder: (context, state) => const SplashPage(),
          ),
          GoRoute(
            path: '/character',
            name: AppRoute.characterSelect.name,
            builder: (context, state) => const CharacterSelectPage(),
          ),
          GoRoute(
            path: '/intro',
            name: AppRoute.intro.name,
            builder: (context, state) => const IntroPage(),
          ),
          GoRoute(
            path: '/scenario/:id',
            name: AppRoute.scenario.name,
            builder: (context, state) {
              final id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
              return ScenarioPage(scenarioId: id);
            },
          ),
          GoRoute(
            path: '/summary',
            name: AppRoute.summary.name,
            builder: (context, state) => const SummaryPage(),
          ),
        ],
      ),
    ];
