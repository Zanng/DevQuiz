import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widget/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/models/awnser_model.dart';
import 'package:DevQuiz/home/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel awnsers(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for(var i = 0; i < widget.question.awnsers.length; i++)
           AwnsertWidget(
             anwser: awnsers(i),
             disable: indexSelected != -1,
             isSelected: indexSelected == i,
             onTap: (){
               indexSelected = i;              
                setState(() {
                  
                });
                Future.delayed(Duration(seconds: 1)).then((value) =>  widget.onChange());
             },
           )
                   
        ],
      ),
    );
  }
}