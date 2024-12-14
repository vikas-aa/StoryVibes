import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Number of audiobooks
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset('assets/images/audiobook_$index.jpg'),
                  title: Text("Audiobook $index"),
                  subtitle: Text("Author $index"),
                  onTap: () {
                    // Navigate to the player screen with the audiobook index as an argument
                    Navigator.pushNamed(context, '/player', arguments: index);
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/leaderboard'),
            child: Text("View Leaderboard"),
          ),
        ],
      ),
    );
  }
}
