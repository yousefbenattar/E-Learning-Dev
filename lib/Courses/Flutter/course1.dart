import 'package:flutter/material.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf1.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf2.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf3.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf4.dart';
import 'package:pff_flutter_app/Courses/JAVA/pdf5.dart';

import 'package:pff_flutter_app/navbar.dart';


 class Fluttercourses extends StatelessWidget {
  const Fluttercourses({super.key});

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
      
        // Add more routes for additional screens as needed
      },
      
    );
  }
}


class MyHomePage extends StatelessWidget {
  
  final List<Map<String, dynamic>> dataList = [
    {'name': 'Chapter I Dart introduction', 'icon': 'images/pdficon.png', 'route': '/pdf1'},
    {'name': 'Chapter II -- More about Dart', 'icon': 'images/pdficon.png', 'route': '/pdf2'},
    {'name': 'Flutter framework', 'icon': 'images/pdficon.png', 'route': '/pdf3'},
    {'name': 'Flutter_Checklist', 'icon': 'images/pdficon.png', 'route': '/pdf4'},
    {'name': 'Material widgets', 'icon': 'images/pdficon.png', 'route': '/pdf5'},
// Add more items as needed
  ];

   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer:const navbar(),
      appBar: AppBar(
        title: const Text('Flutter :'),
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