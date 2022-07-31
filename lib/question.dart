// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  final dynamic answers;
  final void Function(int) callback;

  Question(
      {Key? key,
      required this.questionText,
      required this.answers,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          questionText,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        ...(answers.map((answerOption) => ElevatedButton(
            onPressed: () => {callback(answerOption['points'])},
            child: Text(answerOption['text'])))).toList(),
      ],
    );
  }
}
