import 'package:flutter/material.dart';
import 'package:learning/models/chatMessageEntity.dart';
import 'package:learning/services/auth_service.dart';
import 'package:provider/provider.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({super.key, required this.onSubmit});
final noteMessageController = TextEditingController();




void onSendButtonPressed(BuildContext context)async{
  String? userNameFromChache = await context.read<AuthService>().getUserName();
  print('${noteMessageController.text}');

  final newNoteMessage = ChatMessageEntity(text: noteMessageController.text,
      id: '244', createdAt: DateTime.now().millisecondsSinceEpoch, author: Author(
          userName:
        userNameFromChache!));
  onSubmit(newNoteMessage);
}
@override
  Widget build(BuildContext context) {
    return  Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,minLines: 1,
            controller: noteMessageController,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Note',
              hintStyle: TextStyle(color: Colors.blueGrey),
              border: InputBorder.none
            ),
          )),
          IconButton(onPressed: (){
            onSendButtonPressed(context);
          }
              , icon: Icon(Icons.send,color: Colors.white,))
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))
      ),
    );
  }
}
