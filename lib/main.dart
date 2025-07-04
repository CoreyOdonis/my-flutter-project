import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final Color cardBackground = const Color(0xFFF0F4F8); // soft gray-blue background
  final Color sectionTitleColor = Color(0xFF37474F);   // blue-gray text
  final Color bodyTextColor = Color(0xFF263238);       // darker body text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My First Task')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top Navigation Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.arrow_back),
                Text(
                  'User Profile',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.settings),
              ],
            ),
            const SizedBox(height: 30),

            // Profile Picture
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue,
                    width: 3,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage("https://example.com/profile.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Bio
            const Text(
              'Akorede da Silva',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Budding mobile developer with a passion for elegant UI and intuitive user experience.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Skills Card
            InfoCard(
              title: "Skills",
              content:
                  "Flutter, Dart, UI/UX Design, Git, Agile Development, Product Management, 3D Modelling, Game Development",
              background: cardBackground,
              titleColor: sectionTitleColor,
              bodyColor: bodyTextColor,
            ),

            const SizedBox(height: 20),

            // Contact Info Card
            InfoCard(
              title: "Contact Info",
              content:
                  "Email: qorede@gmail.com\nPhone: +2348169788043\nLinkedIn: linkedin.com/in/akorede-dasilva",
              background: cardBackground,
              titleColor: sectionTitleColor,
              bodyColor: bodyTextColor,
            ),

            const SizedBox(height: 20),

            // Socials Card
            InfoCard(
              title: "Socials",
              content:
                  "Twitter: twitter.com/coreyodonis\nBehance: behance.net/coreyodonis\nGitHub: github.com/coreyodonis",
              background: cardBackground,
              titleColor: sectionTitleColor,
              bodyColor: bodyTextColor,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final Color background;
  final Color titleColor;
  final Color bodyColor;

  const InfoCard({
    super.key,
    required this.title,
    required this.content,
    required this.background,
    required this.titleColor,
    required this.bodyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                fontSize: 15,
                color: bodyColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
