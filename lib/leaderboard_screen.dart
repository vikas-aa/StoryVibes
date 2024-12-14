import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> leaderboard = [
    {"name": "Alice", "points": 1200},
    {"name": "Bob", "points": 1100},
    {"name": "Charlie", "points": 1000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leaderboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: leaderboard.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(leaderboard[index]["name"]),
                trailing: Text("${leaderboard[index]["points"]} points"),
              ),
            );
          },
        ),
      ),
    );
  }
}
