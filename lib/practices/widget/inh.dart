import 'package:flutter/material.dart';

import 'main.dart';
class DescendantOfInheritedWidget1 extends StatelessWidget{
  const DescendantOfInheritedWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${InheritedWidget1.of(context).integerData1}'),
      ],
    );
  }
}