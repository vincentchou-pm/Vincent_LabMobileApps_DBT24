import 'package:flutter/material.dart';
import '../widgets/nav_drawer.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Library'), backgroundColor: Colors.blue),
      drawer: NavDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.library_books, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Library Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Your courses and materials',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
