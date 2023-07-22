import 'package:flutter/material.dart';
import 'package:pff_flutter_app/Courses/Android/course1.dart';
import 'package:pff_flutter_app/Courses/Flutter/course1.dart';
import 'package:pff_flutter_app/Courses/JAVA/course1.dart';
import 'package:pff_flutter_app/Courses/JavaEE/course1.dart';
import 'package:pff_flutter_app/Courses/Linux/course1.dart';
import 'package:pff_flutter_app/Courses/NodeJS/course1.dart';
import 'package:pff_flutter_app/Courses/PL-SQL/course1.dart';
import 'package:pff_flutter_app/Courses/UML/course1.dart';
import 'package:pff_flutter_app/Courses/Web_courses/course1.dart';

class CustomCard {
  final String title;
  final String description;
  final String imagePath;
  final Widget linkedScreen;

  CustomCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.linkedScreen,
  });
}

class HorizontalCardScroll extends StatelessWidget {
  final List<CustomCard> cards = [
    CustomCard(
      title: 'Web 2.0',
      description: '',
      imagePath: 'images/image1.jpg',
      linkedScreen: const Screen1(),
    ),
    CustomCard(
      title: 'Javascript & NodeJS',
      description: '',
      imagePath: 'images/image2.jpg',
      linkedScreen: const Screen2(),
    ),
    // Add more cards as needed
    CustomCard(
      title: 'UML & IFML',
      description: '',
      imagePath: 'images/image3.jpg',
      linkedScreen: const Screen3(),
    ),
    // Add more cards as needed
    CustomCard(
      title: 'JAVA',
      description: '',
      imagePath: 'images/image4.jpg',
      linkedScreen: const Screen4(),
    ),
    // Add more cards as needed
    CustomCard(
      title: 'PL/SQL',
      description: '',
      imagePath: 'images/image5.jpg',
      linkedScreen: const Screen5(),
    ),
    // Add more cards as needed
    CustomCard(
      title: 'Mobile hybride',
      description: '',
      imagePath: 'images/image6.jpg',
      linkedScreen: const Screen6(),
    ),
    // Add more cards as needed
    CustomCard(
      title: 'Linux & Virtualisation',
      description: '',
      imagePath: 'images/image7.jpg',
      linkedScreen: const Screen7(),
    ),
    // Add more cards as needed
    CustomCard(
      title: 'JavaEE',
      description: '',
      imagePath: 'images/image8.jpg',
      linkedScreen: const Screen8(),
    ),
    // Add more cards as needed
    CustomCard(
      title: 'Android',
      description: '',
      imagePath: 'images/image9.jpg',
      linkedScreen: const Screen9(),
    ),
    // Add more cards as needed
  ];

   HorizontalCardScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Adjust the slide height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => card.linkedScreen,
                ),
              );
            },
            child: Container(
              width: 350, // Adjust the slide width as needed
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      card.imagePath,
                      width: 140, // Adjust the image width as needed
                      height: 150, // Adjust the image height as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            card.title,
                            style: const TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            card.description,
                            style: const TextStyle(fontSize: 20),
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

// Define screen classes for each slide
class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const webcourses(),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Nodejscourses(),
    );
  }
}
 
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Umlcourses(),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JAVAcourses(),
    );
  }
}

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Plsqlcourses(),
    );
  }
}

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Fluttercourses(),
    );
  }
}

class Screen7 extends StatelessWidget {
  const Screen7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Linuxcourses(),
    );
  }
}

class Screen8 extends StatelessWidget {
  const Screen8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JavaEEcourses(),
    );
  }
}

class Screen9 extends StatelessWidget {
  const Screen9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Androidcourses(),
    );
  }
}