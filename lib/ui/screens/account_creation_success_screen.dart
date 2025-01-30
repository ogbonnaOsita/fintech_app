import 'package:fintech_app/ui/screens/dashboard_screen.dart';
import 'package:fintech_app/ui/widgets/custom_button.dart';
import 'package:fintech_app/utils/constants.dart';
import 'package:flutter/material.dart';

class AccountCreationSuccessScreen extends StatelessWidget {
  const AccountCreationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              // Time and battery status bar would be handled by the system

              // Logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      Constants.kAppName,
                      style: TextStyle(
                        fontSize: 28,
                        color: Constants.kSecondaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              Image.asset(
                'assets/images/welcome.png',
                height: 200,
              ),

              // Welcome text
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'You\'ve successfully created your account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),

              // Continue button
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => DashboardScreen(),
                    ),
                  );
                },
                type: ButtonType.elevated,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
