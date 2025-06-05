import 'dart:ui';

import 'package:cross_culture/routes/routes.dart';
import 'package:cross_culture/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class App extends HookWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        final observer = _AppLifecycleObserver(context);
        final binding = WidgetsBinding.instance..addObserver(observer);
        return () => binding.removeObserver(observer);
      },
      const [],
    );

    final rootNavigatorKey = useRef(
      GlobalKey<NavigatorState>(debugLabel: 'routerKey'),
    );

    final router = useMemoized(
      () => GoRouter(
        initialLocation: '/',
        navigatorKey: rootNavigatorKey.value,
        routes: getAppRoutes(rootNavigatorKey),
        redirect: (context, state) {
          final scenarioId = state.uri.queryParameters['scenarioId'];
          if (scenarioId != null &&
              int.tryParse(scenarioId) != null &&
              int.parse(scenarioId) > 0) {
            return null;
          }
          return null;
        },
      ),
    );
    return MaterialApp.router(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerConfig: router,
    );
  }
}

/// Observer to handle app lifecycle events, particularly for network
/// reconnection after standby
class _AppLifecycleObserver extends WidgetsBindingObserver {
  _AppLifecycleObserver(this.context);

  final BuildContext context;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // App is visible and running in foreground
        _handleAppResumed();
      case AppLifecycleState.inactive:
        // App is inactive
        break;
      case AppLifecycleState.paused:
        // App is in background
        break;
      case AppLifecycleState.detached:
        // App is detached (e.g. killed)
        break;
      case AppLifecycleState.hidden:
        // App is hidden (newer Flutter versions)
        break;
    }
  }

  void _handleAppResumed() {}
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
