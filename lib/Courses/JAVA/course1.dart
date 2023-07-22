import 'package:flutter/material.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf1.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf2.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf3.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf4.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf5.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf6.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf7.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf8.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf9.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf10.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf11.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf12.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf13.dart';
import 'package:pff_flutter_app/navbar.dart';


 class JAVAcourses extends StatelessWidget {
  const JAVAcourses({super.key});

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
        '/pdf10': (context) => const Pdf10(title: 'Pdf Viewer 10'),
        '/pdf11': (context) => const Pdf11(title: 'Pdf Viewer 11'),
        '/pdf12': (context) => const Pdf12(title: 'Pdf Viewer 12'),
        '/pdf13': (context) => const Pdf13(title: 'Pdf Viewer 13'),
        // Add more routes for additional screens as needed
      },
      
    );
  }
}


class MyHomePage extends StatelessWidget {
  
  final List<Map<String, dynamic>> dataList = [
    {'name': 'Chap 0 Introduction générale', 'icon': 'images/pdficon.png', 'route': '/pdf1'},
    {'name': 'Chap 1 Introduction à la POO', 'icon': 'images/pdficon.png', 'route': '/pdf2'},
    {'name': 'Chap 10 Interface graphique en Java', 'icon': 'images/pdficon.png', 'route': '/pdf3'},
    {'name': 'Chap 11 Les enumerations et les expressions Lambda', 'icon': 'images/pdficon.png', 'route': '/pdf4'},
    {'name': 'Chap 2  Bases du Langage  Java', 'icon': 'images/pdficon.png', 'route': '/pdf5'},
    {'name': 'Chap 3 Classe et Objet', 'icon': 'images/pdficon.png', 'route': '/pdf6'},
    {'name': 'Chap 4 Héritage et Polymorphisme', 'icon': 'images/pdficon.png', 'route': '/pdf7'},
    {'name': 'Chap 5  Les exceptions', 'icon': 'images/pdficon.png', 'route': '/pdf8'},
    {'name': 'Chap 6 Les classes abstraites et les interfaces', 'icon': 'images/pdficon.png', 'route': '/pdf9'},
    {'name': 'Chap 7 Les Collections', 'icon': 'images/pdficon.png', 'route': '/pdf10'},
    {'name': 'Chap 8 Les flux d’entrée sortie', 'icon': 'images/pdficon.png', 'route': '/pdf11'},
    {'name': 'Chap 9 Généricité', 'icon': 'images/pdficon.png', 'route': '/pdf12'},
    {'name': 'Utilisation des interfaces Comparable et Comparator', 'icon': 'images/pdficon.png', 'route': '/pdf13'},
    // Add more items as needed
  ];

   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer:const navbar(),
      appBar: AppBar(
        title: const Text('JAVA :'),
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