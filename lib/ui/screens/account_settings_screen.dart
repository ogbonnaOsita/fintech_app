import 'package:fintech_app/utils/constants.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        forceMaterialTransparency: true,
        title: const Text(
          'Account Settings',
          style: TextStyle(fontWeight: FontWeight.w600, color: Constants.kSecondaryColor),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App Bar

              // Profile Section
              Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: const AssetImage('assets/profile.jpg'),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Constants.kPrimaryColor,
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tommy Jason',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'tommyjason@gmail.com',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Account Details
              _buildDetailItem('Account Number', '3024982387'),
              _buildDetailItem('Username', 'Aryan.Stirk2'),
              _buildDetailItem('Email', 'aryan.stirk2nd@gmail.com'),
              _buildDetailItem('Mobile Phone', '+620932938232'),
              _buildDetailItem('Address', 'Gotham Road 21...'),

              const SizedBox(height: 20),

              // Settings Options
              // _buildSettingItem('Change Pin', true),
              // _buildSettingItem('Change Password', true),

              _buildDetailItem('State', 'Lagos'),
              _buildDetailItem('L.G.A', 'Ikeja'),
              // _buildDetailItem('Address', 'Gotham Road 21...'),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
