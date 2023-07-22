
import 'package:flutter/material.dart';
import 'package:pff_flutter_app/UML/dbuml.dart';
import 'package:pff_flutter_app/constants.dart';
import 'package:pff_flutter_app/widgets/next_button.dart';
import 'package:pff_flutter_app/widgets/option_card.dart';
import 'package:pff_flutter_app/widgets/question_widget.dart';
import 'package:pff_flutter_app/widgets/result_box.dart';
import '../models/question_model.dart';

class uml extends StatefulWidget {
  const uml({super.key});

  @override
  State<uml> createState() => _umlState();
}

class _umlState extends State<uml> {

   late Future _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestions();
  }
  @override
  void initState() {
    _questions = getData();
    super.initState();
  }
// create an object for Dbconnect
  var db = dbuml();
  int index = 0;
  bool isAlreadySelected = false;
  int score = 0;
  bool isPressed = false;
  void nextQuestion( questionLength) {
    if (index == questionLength - 1) {
      // this is the block where the questions end.
      showDialog(
          context: context,
          barrierDismissible: false , // this will disable the dissmis function on clicking outside of box
          builder: (ctx) => ResultBox(
                result: score, // total points the user got
                questionLength: questionLength, // out of how many questions
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select an option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }
  // create a function to start over
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }
  // create a function for changing color
  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
           else if (snapshot.hasData)
            {
            var extractedData = snapshot.data as List<Question>;
            return  Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          title: const Text('E Learning Dev'),
          backgroundColor: background,
          shadowColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Score: $score',
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              // add the questionWIdget here
const SizedBox(height: 20.0),
                    Container(
                      color: neutral, // Set the background color to white
                      child: QuestionWidget(
                        indexAction: index, // currently at 0.
                        question: extractedData[index]
                            .title, // means the first question in the list.
                        totalQuestions:
                            extractedData.length, // total length of the list
                      ),
                    ),
              const Divider(color: background),
              // add some space
              const SizedBox(height: 25.0),
              for (int i = 0; i < extractedData[index].options.length; i++)
                GestureDetector(
                  onTap: () => checkAnswerAndUpdate(
                      extractedData[index].options.values.toList()[i]),
                  child: OptionCard(
                    option: extractedData[index].options.keys.toList()[i],
                    color: isPressed
                        ? extractedData[index].options.values.toList()[i] == true
                            ? correct
                            : incorrect
                        : neutral,
                  ),
                ),
            ],
          ),
        ),
    // use the floating action button
        floatingActionButton: GestureDetector(
          onTap: () =>nextQuestion(extractedData.length) ,
          child:const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0),
            child: NextButton(
              
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ); 

      }
      }
      else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20.0),
                Text(
                  'Please Wait while Questions are loading..',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          );
        } 
        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}