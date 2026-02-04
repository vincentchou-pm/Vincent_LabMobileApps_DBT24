import 'package:flutter/material.dart';
import '../widgets/nav_drawer.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.light_mode_outlined, color: Colors.black, size: 20),
            Switch(
              value: false,
              onChanged: (value) {},
              activeColor: Colors.grey,
            ),
            Icon(Icons.dark_mode_outlined, color: Colors.black, size: 20),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_outlined, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Hi, JMK48 ! 👋',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // Recently accessed courses
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently accessed courses',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, size: 16),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios, size: 16),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Course Card
            Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.blue[700]!, Colors.blue[400]!],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'S1ESE',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'MOBILE APPLICATION DEVELOPMENT\n(PNM-ESEU2220-S1DBT24_4-L)',
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Calendar Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Calendar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('All courses'),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text('New event'),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {},
                      ),
                      Text(
                        'February 2026',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text('March', style: TextStyle(color: Colors.grey)),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Calendar Grid
                  Table(
                    children: [
                      TableRow(
                        children:
                            ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                                .map(
                                  (day) => Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        day,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                      ...List.generate(5, (weekIndex) {
                        return TableRow(
                          children: List.generate(7, (dayIndex) {
                            int day = weekIndex * 7 + dayIndex - 1;
                            if (day < 0 || day > 27) return SizedBox.shrink();
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text('${day + 1}'),
                              ),
                            );
                          }),
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('Full calendar'),
                      ),
                      Text(' • '),
                      TextButton(
                        onPressed: () {},
                        child: Text('Import or export calendars'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              color: Colors.grey[900],
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    'Contact us',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[700],
                        child: Icon(Icons.location_on, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.grey[700],
                        child: Icon(Icons.phone, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.grey[700],
                        child: Icon(Icons.email, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Follow us',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(Icons.video_library, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.purple,
                        child: Icon(Icons.camera_alt, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.support_agent, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Contact site support',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'You are logged in as JMK48',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Reset user tour on this page',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Get the mobile app only on',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg',
                    height: 40,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 40,
                      child: Text(
                        'Google Play',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/3/3c/Download_on_the_App_Store_Badge.svg',
                    height: 40,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 40,
                      child: Text(
                        'App Store',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Divider(color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                    'Powered by Moodle',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
