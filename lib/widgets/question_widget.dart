import 'package:flutter/material.dart';
// it contains our colors.

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions})
      : super(key: key);
  // here we need the question title and the total number of questions, and also the index

  final String question;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(

  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: [

      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),

    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Question ${indexAction + 1}/$totalQuestions',
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          question,
          style: const TextStyle(
            fontSize: 30.0,
            color: Colors.black87,
          ),
        ),
      ),

    ],
  ),
);

  }
}