import 'package:flutter/material.dart';
import 'package:pff_flutter_app/Courses/PL-SQL/pdf1.dart';
import 'package:pff_flutter_app/Courses/PL-SQL/pdf2.dart';
import 'package:pff_flutter_app/Courses/PL-SQL/pdf3.dart';
import 'package:pff_flutter_app/navbar.dart';


 class Plsqlcourses extends StatelessWidget {
  const Plsqlcourses({super.key});

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

        // Add more routes for additional screens as needed
      },
      
    );
  }
}


class MyHomePage extends StatelessWidget {
  
  final List<Map<String, dynamic>> dataList = [
    
    {'name': 'Cours Base de données II v 2020 (1)', 'icon': 'images/pdficon.png', 'route': '/pdf1'},
    {'name': 'Cours Base de données II v 2020', 'icon': 'images/pdficon.png', 'route': '/pdf2'},
    {'name': 'base de donnes web', 'icon': 'images/pdficon.png', 'route': '/pdf3'},


    // Add more items as needed
  ];

   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer:const navbar(),
      appBar: AppBar(
        title:const Text('PL/SQL :'),
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