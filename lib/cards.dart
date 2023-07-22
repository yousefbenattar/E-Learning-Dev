import 'package:flutter/material.dart';
import 'package:pff_flutter_app/Android/android.dart';
import 'package:pff_flutter_app/Flutter/flutter.dart';
import 'package:pff_flutter_app/JAVA/java.dart';
import 'package:pff_flutter_app/JavaEE/javaee.dart';
import 'package:pff_flutter_app/Linux/linux.dart';
import 'package:pff_flutter_app/NodeJS/nodejs.dart';
import 'package:pff_flutter_app/PL-SQL/sql.dart';
import 'package:pff_flutter_app/UML/uml.dart';
import 'package:pff_flutter_app/screens/home_screen.dart';

class CardTest extends StatelessWidget {
  // List of images for the cards
  final List<String> cardImages = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image5.jpg',
    'images/image6.jpg',
    'images/image7.jpg',
    'images/image8.jpg',
    'images/image9.jpg',
  ];

  // List of titles for the cards
  final List<String> cardTitles = [
    'WEB 2.0',
    'Javascript & NodeJS',
    'UML & IFML',
    'JAVA',
    'PL/SQL',
    'Mobile hybride',
    'Linux & Virtualisation',
    'JavaEE',
    'Android',
  ];

  // List of descriptions for the cards
  final List<String> cardDescriptions = [
    'Web 2.0 refers to websites that emphasize user-generated content, ease of use, participatory culture and interoperability for end users.',
    'Node.js is a cross-platform, open-source server environment that can run on Windows, Linux, Unix, macOS, and more.',
    'The unified modeling language is a general-purpose modeling language that is intended to provide a standard way to visualize the design of a system.',
    'Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.',
    'PL/SQL is Oracle Corporations procedural extension for SQL and the Oracle relational database. PL/SQL is available in Oracle Database,',
    'Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications from a single codebase for any web browser, Fuchsia, Android, iOS, Linux, macOS, and Windows.',
    'Linux is a family of open-source Unix-like operating systems based on the Linux kernel, an operating system kernel first released on September 17, 1991, by Linus Torvalds.',
    'Jakarta EE, formerly Java Platform, Enterprise Edition and Java 2 Platform, Enterprise Edition, is a set of specifications',
    'Android is a mobile operating system based on a modified version of the Linux kernel and other open-source software, designed primarily for touchscreen mobile devices such as smartphones and tablets.',
  ];

  // List of screens to navigate to when a card is clicked
  final List<Widget> destinationScreens = [
    const Homescreen(),
    const nodejs(),
    const uml(),
    const java(),
    const sql(),
    const flutter(),
    const linux(),
    const javaee(),
    const android(),
    // Add other screens here for the remaining cards
  ];

  CardTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: ListView.builder(
        itemCount: cardImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the appropriate screen when a card is clicked
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => destinationScreens[index]),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    16.0), // Adjust the radius as per your preference
              ),
              child: Row(
                children: [
                  // Left side containing the image
                  Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1.0, // 1:1 aspect ratio for square images
                      child: Image.asset(
                        cardImages[index],
                        fit: BoxFit
                            .cover, // This will make the image fill the entire space
                      ),
                    ),
                  ),
                  // Right side containing the title and description
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cardTitles[index],
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            cardDescriptions[index],
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
