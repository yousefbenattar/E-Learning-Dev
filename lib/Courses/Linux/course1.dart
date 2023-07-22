import 'package:flutter/material.dart';
import 'package:pff_flutter_app/Courses/Linux/pdf1.dart';
import 'package:pff_flutter_app/Courses/Linux/pdf2.dart';
import 'package:pff_flutter_app/Courses/Linux/pdf3.dart';
import 'package:pff_flutter_app/Courses/Linux/pdf4.dart';
import 'package:pff_flutter_app/Courses/Linux/pdf5.dart';
import 'package:pff_flutter_app/Courses/Linux/pdf6.dart';
import 'package:pff_flutter_app/Courses/Linux/pdf7.dart';
import 'package:pff_flutter_app/Courses/Linux/pdf8.dart';
import 'package:pff_flutter_app/Courses/Linux/pdf9.dart';
import 'package:pff_flutter_app/navbar.dart';


 class Linuxcourses extends StatelessWidget {
  const Linuxcourses({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  MyHomePage(),
        '/pdf1': (context) => const Pdf1(title: 'Pdf Viewer 1'),
        '/pdf2': (context) => const Pdf2(title: 'Pdf Viewer 2'),
        '/pdf3': (context) => const Pdf3(title: 'Pdf Viewer 3'),
        '/pdf4': (context) => const Pdf4(title: 'Pdf Viewer 4'),
        '/pdf5': (context) => const Pdf5(title: 'Pdf Viewer 5'),
        '/pdf6': (context) => const Pdf6(title: 'Pdf Viewer 6'),
        '/pdf7': (context) => const Pdf7(title: 'Pdf Viewer 7'),
        '/pdf8': (context) => const Pdf8(title: 'Pdf Viewer 8'),
        '/pdf9': (context) => const Pdf9(title: 'Pdf Viewer 9'),
        // Add more routes for additional screens as needed
      },
      
    );
  }
}


class MyHomePage extends StatelessWidget {
  
  final List<Map<String, dynamic>> dataList = [
    {'name': 'Docker', 'icon': 'images/pdficon.png', 'route': '/pdf1'},
    {'name': 'Gestion de Processus', 'icon': 'images/pdficon.png', 'route': '/pdf2'},
    {'name': 'Gestion-utilisateurdroit-dacces', 'icon': 'images/pdficon.png', 'route': '/pdf3'},
    {'name': 'Introduction  Installation', 'icon': 'images/pdficon.png', 'route': '/pdf4'},
    {'name': 'LVM  Programmation shell', 'icon': 'images/pdficon.png', 'route': '/pdf5'},
    {'name': 'Partitionnement de disque', 'icon': 'images/pdficon.png', 'route': '/pdf6'},
    {'name': 'Planification des taches', 'icon': 'images/pdficon.png', 'route': '/pdf7'},
    {'name': 'Programmation Shell', 'icon': 'images/pdficon.png', 'route': '/pdf8'},
    {'name': 'Virtualisation', 'icon': 'images/pdficon.png', 'route': '/pdf9'},
   
    // Add more items as needed
  ];

   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer:const navbar(),
      appBar: AppBar(
        title: const Text('Linux & Virtualisation :'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, dataList[index]['route']),
            child: Card(
              child: ListTile(
                leading: Image.asset(dataList[index]['icon'], width: 200, height: 200),
                title: Text(dataList[index]['name']),
              ),
            ),
          );
        },
      ),
    );
  }
}