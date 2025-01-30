import 'package:fintech_app/ui/screens/account_creation_success_screen.dart';
import 'package:fintech_app/ui/screens/login_screen.dart';
import 'package:fintech_app/ui/screens/personal_info_form.dart';
import 'package:fintech_app/ui/widgets/custom_button.dart';
import 'package:fintech_app/utils/constants.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   'assets/images/start.png',
                  //   height: 40,
                  // ),
                  const SizedBox(width: 8),
                  Text(
                    Constants.kAppName,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Constants.kSecondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Image.asset(
                'assets/images/start.png',
                height: 200,
              ),
              const SizedBox(
                height: 60,
              ),
              // Login Button
              CustomButton(
                text: 'Log In',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => LoginScreen(),
                    ),
                  );
                },
                type: ButtonType.elevated,
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => PersonalInfoForm(),
                    ),
                  );
                },
                type: ButtonType.outlined,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
