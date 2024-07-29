
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';


class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
   return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers=[];
  var activeScreen="start_secreen";

 

  void switchScreen(){
    setState(() {
      activeScreen = "questions_screen";
    });
  }
  void chooseAsswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length){
      setState(() {
    
        activeScreen="results-screen";
      }
      );
    }
    
  }
 
 void restartQuiz(){
  setState(() {
    selectedAnswers=[];
    activeScreen="questions_screen";
  });
 }
  @override
  Widget build(BuildContext context){
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen ==  "questions_screen") {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAsswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget =  ResultsScreen(chosenAnswers: selectedAnswers,onRestart: restartQuiz,);
    }

    return MaterialApp(
      home:Scaffold (
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors:[ Colors.deepPurple,Color.fromARGB(255, 165, 129, 226)],begin: Alignment.topLeft,end: Alignment.bottomRight),
        ),
        
        child: screenWidget),
    ));

  }
}