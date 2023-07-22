import 'package:flutter/material.dart';
import 'package:pff_flutter_app/Courses/JavaEE/pdf1.dart';
import 'package:pff_flutter_app/Courses/JavaEE/pdf2.dart';
import 'package:pff_flutter_app/Courses/JavaEE/pdf3.dart';
import 'package:pff_flutter_app/Courses/JavaEE/pdf4.dart';
import 'package:pff_flutter_app/Courses/JavaEE/pdf5.dart';
import 'package:pff_flutter_app/Courses/JavaEE/pdf6.dart';
import 'package:pff_flutter_app/Courses/JavaEE/pdf7.dart';
import 'package:pff_flutter_app/Courses/JavaEE/pdf8.dart';
import 'package:pff_flutter_app/navbar.dart';


 class JavaEEcourses extends StatelessWidget {
  const JavaEEcourses({super.key});

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
    {'name': 'Séance 1 _ Introduction Java EE', 'icon': 'images/pdficon.png', 'route': '/pdf1'},
    {'name': 'Séance 3 _ Servlet-2 (Servlet JSP et JSTL)', 'icon': 'images/pdficon.png', 'route': '/pdf2'},
    {'name': 'Séance 4 _ JSTL et JDBC', 'icon': 'images/pdficon.png', 'route': '/pdf3'},
    {'name': 'Séance 5 _ JPA (1)', 'icon': 'images/pdficon.png', 'route': '/pdf4'},
    {'name': 'Séance 6 _ JPA (2)', 'icon': 'images/pdficon.png', 'route': '/pdf5'},
    {'name': 'Séance 7', 'icon': 'images/pdficon.png', 'route': '/pdf6'},
    {'name': 'Séance 8', 'icon': 'images/pdficon.png', 'route': '/pdf7'},
    {'name': 'Séance 2 _ Servlet-1', 'icon': 'images/pdficon.png', 'route': '/pdf8'},
  
   
    // Add more items as needed
  ];

   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer:const navbar(),
      appBar: AppBar(
        title: const Text('JavaEE :'),
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