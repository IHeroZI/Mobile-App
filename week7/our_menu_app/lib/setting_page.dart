// settings_page.dart
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  String selectedLanguage = 'ไทย';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // User Profile Section
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Guest User',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add login/profile edit logic
                },
                child: const Text('แก้ไขโปรไฟล์'),
              ),
            ],
          ),
        ),

        const Divider(),

        // Settings Options
        Expanded(
          child: ListView(
            children: [
              // Notifications Section
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('การแจ้งเตือน'),
                trailing: Switch(
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                ),
              ),

              // Dark Mode Section
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('โหมดกลางคืน'),
                trailing: Switch(
                  value: darkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      darkModeEnabled = value;
                    });
                  },
                ),
              ),

              // Language Section
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('ภาษา'),
                trailing: DropdownButton<String>(
                  value: selectedLanguage,
                  items: const [
                    DropdownMenuItem(
                      value: 'ไทย',
                      child: Text('ไทย'),
                    ),
                    DropdownMenuItem(
                      value: 'English',
                      child: Text('English'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                  },
                ),
              ),

              // Address Section
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('ที่อยู่การจัดส่ง'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Add address management logic
                },
              ),

              // Order History
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('ประวัติการสั่งซื้อ'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Add order history logic
                },
              ),

              // Payment Methods
              ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('วิธีการชำระเงิน'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Add payment methods logic
                },
              ),

              const Divider(),

              // Help & Support Section
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('ช่วยเหลือและสนับสนุน'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Add help/support logic
                },
              ),

              // About Section
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('เกี่ยวกับแอป'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Add about page logic
                },
              ),

              // Logout Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Add logout logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('ออกจากระบบ'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}