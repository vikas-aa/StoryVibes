import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> achievements = [
    {"title": "First Audiobook", "status": "Unlocked"},
    {"title": "10 Hours Listening", "status": "Locked"},
    {"title": "Top Listener", "status": "Locked"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Achievements"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: achievements.length,
          itemBuilder: (context, index) {
            bool isUnlocked = achievements[index]["status"] == "Unlocked";
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              color: isUnlocked ? Colors.green[100] : Colors.grey[200],
              child: ListTile(
                leading: Icon(
                  isUnlocked ? Icons.lock_open : Icons.lock,
                  color: isUnlocked ? Colors.green : Colors.grey,
                ),
                title: Text(
                  achievements[index]["title"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isUnlocked ? Colors.black : Colors.grey,
                  ),
                ),
                trailing: Text(
                  achievements[index]["status"],
                  style: TextStyle(
                    color: isUnlocked ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
