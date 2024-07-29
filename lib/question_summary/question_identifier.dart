
import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget{
   const QuestionIdentifier({super.key,required this.isCorrectAnswer,required this.qustionIndex});

   final int qustionIndex;
   final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber=qustionIndex+1;

   return Container(
       width: 30,
       height: 30,
       alignment: Alignment.center,
       decoration: BoxDecoration(color: isCorrectAnswer?Colors.blueAccent:Colors.redAccent,borderRadius: BorderRadius.circular(100)),
       child: Text(
        questionNumber.toString(),
       style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
       ),
       

   );

  }

}