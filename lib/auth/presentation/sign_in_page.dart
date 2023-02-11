import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'Welcome to\n Repo Viewer',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Sign In'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
