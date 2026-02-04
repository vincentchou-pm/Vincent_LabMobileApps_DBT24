import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STEM Prasmul',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'STEM Prasmul'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 223, 1, 38),
        title: Image.asset('assets/images/logo_stem.png', height: 40),
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: const Color(0xFF3A3A3A),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      children: [
                        _buildDrawerItem('PROGRAMS'),
                        _buildDrawerItem('ADMISSION'),
                        _buildDrawerItem('PEOPLE'),
                        _buildDrawerItem('LABORATORY'),
                        _buildDrawerItem('CAMPUS LIFE'),
                        _buildDrawerItem('OFFICE & SERVICES'),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // White content area
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/logo_upm_biru.png',
                              height: 150,
                            ),
                            const SizedBox(height: 16),

                            // Vision Section
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'VISION',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'A globally recognized School for STEMpreneur Education and Research',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade700,
                                      height: 1.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 32),

                            // Mission Section
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'MISSION',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Provide quality STEM education and research for nurturing the holistic citizen graduates through:',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade700,
                                      height: 1.6,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  _buildMissionItem(
                                    '1',
                                    'Collaborative learning by enterprising involving interdisciplinary catalytic projects',
                                  ),
                                  const SizedBox(height: 12),
                                  _buildMissionItem(
                                    '2',
                                    'Innovative and impactful research to the society',
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),

                    // Footer Section
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'BSD City Kavling Edutown I.1',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Jl. BSD Raya Utama, BSD City 15339',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                          Text(
                            'Kabupaten Tangerang, Indonesia',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text(
                                'Tel.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '(021) 304-50-500',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Text(
                                'Hp.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '(+62) 81511662005',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'info@prasetyamulya.ac.id',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMissionItem(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDrawerItem(String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          letterSpacing: 0.5,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Menu Item Clicked'),
              content: Text('$title has been clicked'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
