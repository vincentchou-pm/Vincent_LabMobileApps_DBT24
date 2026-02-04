import 'package:flutter/material.dart';
import '../widgets/nav_drawer.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), backgroundColor: Colors.blue),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                '23502410025',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Vincent Chou',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Email'),
                      subtitle: Text('vincent@example.com'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Phone'),
                      subtitle: Text('+62 123 456 7890'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.school),
                      title: Text('Program'),
                      subtitle: Text('Mobile Application Development'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('Enrolled'),
                      subtitle: Text('February 2026'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
