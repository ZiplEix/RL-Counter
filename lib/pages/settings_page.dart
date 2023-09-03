import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final db = Hive.box('counters');

  void showDialogDelAll() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Clear all data"),
          content: const Text("Are you sure you want to clear all data ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                db.clear();
                Navigator.pop(context);
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  void showDialogDelOne() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Clear one day"),
          content: const Text("Choose the day you want to clear"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (pickedDate != null) {
                  var key =
                      "${pickedDate.day}${pickedDate.month}${pickedDate.year}";
                  if (db.containsKey(key)) {
                    db.delete(key);
                  }
                }
              },
              child: const Text("Choose a day"),
            ),
            TextButton(
              onPressed: () {
                // db.clear();
                Navigator.pop(context);
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                value: const Text('English'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Data'),
            tiles: <SettingsTile>[
              SettingsTile(
                title: const Text("Clear cache"),
                description: const Text("Clear all local datas"),
                leading: const Icon(Icons.delete_forever),
                onPressed: (context) {
                  showDialogDelAll();
                },
              ),
              SettingsTile(
                title: const Text("Clear one day"),
                description: const Text("Clear one choosing day"),
                leading: const Icon(Icons.delete),
                onPressed: (context) {
                  showDialogDelOne();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
