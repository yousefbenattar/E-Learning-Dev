import 'package:flutter/material.dart';
import 'package:pff_flutter_app/cards.dart';
import 'package:pff_flutter_app/navbar.dart';
import 'package:pff_flutter_app/HorizontalCardScroll.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const navbar(),
      appBar: AppBar(
        title:const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // First, display the slides
          Container(
            padding:const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child:const Text(
              'Courses :',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

           Expanded(
            flex: 1,
            child: HorizontalCardScroll(),
          ),
          // Then, display the cards beside the slides

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child:const Text(
              'Quizzes :',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: CardTest(),
          ),
        ],
      ),
    );
  }
}