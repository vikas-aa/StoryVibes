import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue, // You can customize the AppBar color here
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            SizedBox(height: 20),
            Text(
              "Vikas Sharma",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Mobile App Developer", // You can add a title or profession here
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blue),
              title: Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("vikas@example.com"),
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.yellow),
              title: Text("Total Points", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("1200"),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                "Go to Settings",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
