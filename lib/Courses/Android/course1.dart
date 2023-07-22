import 'package:flutter/material.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf1.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf2.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf3.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf4.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf5.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf6.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf7.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf8.dart';

import 'package:pff_flutter_app/navbar.dart';


 class Androidcourses extends StatelessWidget {
  const Androidcourses({super.key});

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
        // Add more routes for additional screens as needed
      },
      
    );
  }
}


class MyHomePage extends StatelessWidget {
  
  final List<Map<String, dynamic>> dataList = [
   
    {'name': 'Chapitre 1 Introduction_Développement des Applications Mobiles', 'icon': 'images/pdficon.png', 'route': '/pdf1'},
    {'name': 'Chapitre 2 Interaction avec lutilisateur', 'icon': 'images/pdficon.png', 'route': '/pdf2'},
    {'name': 'Chapitre 3 Activités et gestion des événements', 'icon': 'images/pdficon.png', 'route': '/pdf3'},
    {'name': 'Chapitre 4 ListView et gestion d’une liste d’items', 'icon': 'images/pdficon.png', 'route': '/pdf4'},
    {'name': 'Chapitre 5 Interactions ergonomiques avec l’utilisateur', 'icon': 'images/pdficon.png', 'route': '/pdf5'},
    {'name': 'Chapitre 6 SQLite', 'icon': 'images/pdficon.png', 'route': '/pdf6'},
    {'name': 'Chapitre 7 BD distante', 'icon': 'images/pdficon.png', 'route': '/pdf7'},
    {'name': 'Chapitre 8 Services', 'icon': 'images/pdficon.png', 'route': '/pdf8'},
// Add more items as needed
  ];

   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer:const navbar(),
      appBar: AppBar(
        title: const Text('Android :'),
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