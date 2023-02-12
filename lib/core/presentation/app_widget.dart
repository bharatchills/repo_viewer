import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/routes/app_routes.gr.dart';
import '/auth/application/auth_notifier.dart';

final initializationProvider = FutureProvider<void>((ref) async {
  final authNotifier = ref.read(authNotifierProvider.notifier);
  await authNotifier.checkAndUpdateAuthStatus();
});

class AppWidget extends ConsumerWidget {
  final appRouter = AppRouter();

  AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (previous, _) {});

    ref.listen<AuthState>(authNotifierProvider, (previous, state) {
      state.maybeMap(
        orElse: () {},
        authenticated: (_) {
          appRouter.pushAndPopUntil(
            const StarredReposRoute(),
            predicate: (route) => false,
          );
        },
        unauthenticated: (_) {
          appRouter.pushAndPopUntil(
            const SignInRoute(),
            predicate: (route) => false,
          );
        },
      );
    });

    return MaterialApp.router(
      title: 'Resocoder Repo Viewer',
      theme: _setUpThemeData(context),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }

  ThemeData _setUpThemeData(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Theme.of(context).cardColor,
        foregroundColor: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
