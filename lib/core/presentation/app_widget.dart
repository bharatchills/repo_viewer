import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/application/auth_notifier.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/routes/app_routes.gr.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  final authNotifier = ref.read(authNotifierProvider.notifier);
  await authNotifier.checkAndUpdateAuthStatus();
  return unit;
});

class AppWidget extends ConsumerWidget {
  final appRouter = AppRoute();

  AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      next.maybeMap(
        orElse: () {},
        authenticated: (value) {
          appRouter.pushAndPopUntil(
            const StarredReposRoute(),
            predicate: (route) => false,
          );
        },
        unauthenticated: (value) => appRouter.pushAndPopUntil(
          const SignInRoute(),
          predicate: (route) => false,
        ),
      );
    });
    return MaterialApp.router(
      title: 'Repo Viewer',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
