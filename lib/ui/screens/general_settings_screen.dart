import 'package:fintech_app/utils/constants.dart';
import 'package:flutter/material.dart';

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GeneralSettingsScreenState();
  }
}

class _GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
  bool defaultNotificationActions = false;
  bool billsCalendar = false;
  bool creditScoreCalendar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        forceMaterialTransparency: true,
        title: Text(
          'General Settings',
          style: TextStyle(fontWeight: FontWeight.w600, color: Constants.kSecondaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'Manage Beneficiaries',
                style: TextStyle(
                  color: Color(0xFF1A237E),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Change Authorization',
                style: TextStyle(
                  color: Color(0xFF1A237E),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Transfer Limits',
                style: TextStyle(
                  color: Color(0xFF1A237E),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Change Pin',
                style: TextStyle(
                  color: Color(0xFF1A237E),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
              onTap: () {},
            ),
            const SizedBox(height: 40),
            _buildSettingItem(
              'Fingerprint',
              'Enable or disable login with fingerprint...',
              billsCalendar,
              (value) {
                setState(() => billsCalendar = value);
              },
            ),
            _buildSettingItem(
              'Dark Mode Toggle',
              'Switch between light and dark mode...',
              creditScoreCalendar,
              (value) {
                setState(() => creditScoreCalendar = value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, String subtitle, bool value, Function(bool) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF1A237E),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.green[700],
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
