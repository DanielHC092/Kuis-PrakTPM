import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index) {
      return Card(
        child: Padding(
         padding: EdgeInsets.all(2),
         child: Text('Text $index'),
        ),
      );
    },
      itemCount: 30,
    );

  }
}
