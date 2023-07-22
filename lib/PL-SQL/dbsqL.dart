import 'package:http/http.dart' as http; // the http package
import 'dart:convert';

import 'package:pff_flutter_app/models/question_model.dart';

class dbsqL {
  // let's first create  a function to add a question to our database.
// declare the name of the table you want to create and add .json as suffix
  final url = Uri.parse(
      'https://e-learning-dev-48cc1-default-rtdb.europe-west1.firebasedatabase.app/sqL.json');
  // fetch the data from database
  Future<List<Question>> fetchQuestions() async {
    // we got the data from just using this. now let's print it to see what we got.
    return http.get(url).then((response) {
      // the 'then' method returns a 'response' which is our data.
      // to whats inside we have to decode it first.
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          id: key, // the encrypted key/the title we gave to our data
          title: value['title'], // title of the question
          options: Map.castFrom(value['options']), // options of the question
        );
        // add to newQuestions
        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });
  }
}