import 'package:flutter/material.dart';
import 'package:learning/models/chatMessageEntity.dart';

class Chatbubble extends StatelessWidget {
  const Chatbubble({super.key, required this.entity, required this.alignment,});
final ChatMessageEntity entity;

final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(52),
      child: Container(
         decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25)
          ),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text('${entity.text}',style: TextStyle(color: Colors.blue),textAlign: TextAlign.center,),
          )
      ),
    );
  }
}
