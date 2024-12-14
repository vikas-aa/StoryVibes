import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  final List<Map<String, dynamic>> progress = [
    {"title": "Audiobook 1", "progress": 0.5},
    {"title": "Audiobook 2", "progress": 0.8},
    {"title": "Audiobook 3", "progress": 0.2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Progress"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: progress.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(progress[index]["title"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinearProgressIndicator(
                      value: progress[index]["progress"],
                      color: Colors.green,
                      backgroundColor: Colors.grey.shade300,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Progress: ${(progress[index]["progress"] * 100).toInt()}%",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
