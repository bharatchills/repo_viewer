import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/routes/app_routes.gr.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    MdiIcons.github,
                    size: 150,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Welcome to Repo Viewer',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(authNotifierProvider.notifier)
                          .signIn((authorizationUrl) {
                        final completer = Completer<Uri>();
                        AutoRouter.of(context).push(AuthorizationRoute(
                            authorizationUrl: authorizationUrl,
                            onAuthorizationCodeRedirectAttemp: (url) {
                              completer.complete(url);
                            }));
                        return completer.future;
                      });
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('Sign In'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
