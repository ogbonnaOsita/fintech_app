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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'General Setting',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.notifications_outlined, color: Colors.red[200], size: 28),
              title: const Text(
                'Default Notification Actions',
                style: TextStyle(
                  color: Color(0xFF1A237E),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.red[200], size: 28),
              title: const Text(
                'Manage Notifications',
                style: TextStyle(
                  color: Color(0xFF1A237E),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            _buildSettingItem(
              'Default Notification Actions',
              'You want to receive bill reminders before a bill is due.',
              defaultNotificationActions,
              (value) {
                setState(() => defaultNotificationActions = value);
              },
            ),
            _buildSettingItem(
              'Bills Calendar',
              'You want to receive bill reminder emails before a bill...',
              billsCalendar,
              (value) {
                setState(() => billsCalendar = value);
              },
            ),
            _buildSettingItem(
              'Credit Score Calendar',
              'You want to sync credit score reminders to your device cale...',
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
              activeColor: Colors.red[200],
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
