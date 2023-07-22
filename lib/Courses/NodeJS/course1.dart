import 'package:flutter/material.dart';
import 'package:pff_flutter_app/Courses/Nodejs/pdf1.dart';
import 'package:pff_flutter_app/navbar.dart';


 class Nodejscourses extends StatelessWidget {
  const Nodejscourses({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  MyHomePage(),
        '/pdf1': (context) => Pdf1(title: 'Pdf Viewer 1'),
        // Add more routes for additional screens as needed
      },
      
    );
  }
}


class MyHomePage extends StatelessWidget {
  
  final List<Map<String, dynamic>> dataList = [
    {'name': 'JavaScript-NodeJS', 'icon': 'images/pdficon.png', 'route': '/pdf1'},

    // Add more items as needed
  ];

   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer:const navbar(),
      appBar: AppBar(
        title:const Text('Javascript & NodeJS :'),
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