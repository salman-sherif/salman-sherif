import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning/ChatBubble.dart';
import 'package:learning/ChatInput.dart';
import 'package:learning/models/chatMessageEntity.dart';
import 'package:learning/services/auth_service.dart';
import 'package:provider/provider.dart';

class Chat_page extends StatefulWidget {
  final String username;
   Chat_page({super.key, required this.username});

  @override
  State<Chat_page> createState() => _Chat_pageState();
}

class _Chat_pageState extends State<Chat_page> {
  List<ChatMessageEntity> _messages = [
  ];


  _loadInitialNotes()async{
    final response = await rootBundle.loadString('lib/mock_messages.json');

    final List<dynamic>decodedList = jsonDecode(response) as List;

    final List<ChatMessageEntity> _noteMessages= decodedList.map((listItem){
      return ChatMessageEntity.fromJson(listItem);
    }).toList();
    print(response);

    print(_noteMessages.length);

    setState(() {
      _messages = _noteMessages;
      setState(() {

      });
    });
  }
  onNoteSent(ChatMessageEntity entity){
    _messages.add(entity);
    setState(() {

    });
  }
  @override
  void initState() {
_loadInitialNotes();
super.initState();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Hi ${widget.username}'),
        actions: [
          IconButton(onPressed:() { context.read<AuthService>().logoutUser();Navigator.pop(context);},icon: Icon(Icons.logout))
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index){
              return Chatbubble(
                alignment: index % 2 == 0 ?Alignment.centerLeft:Alignment.centerRight, entity:_messages[index]);

            }),
          ),
          ChatInput(onSubmit: onNoteSent,)
                 ],
      ),
      );

  }
}

