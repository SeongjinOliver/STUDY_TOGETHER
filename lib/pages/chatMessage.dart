import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String txt;
  const ChatMessage(this.txt, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Text("Guest"),
        ),
        Column(
          children: [
            Text('Id Or Name'),
            Text('message'),
          ],
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Id or Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
