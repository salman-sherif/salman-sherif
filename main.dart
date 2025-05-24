import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning/ChatInput.dart';
import 'package:learning/ChatPage.dart';
import 'package:learning/helloworld.dart';
import 'package:learning/login_page.dart';
import 'package:learning/services/auth_service.dart';
import 'package:provider/provider.dart' ;

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
await  AuthService.init();
  runApp(Provider(create: (BuildContext context)  => AuthService(),
  child: ChatApp()));
}
class ChatApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<bool>(
        future: context.read<AuthService>().isLoggedIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData && snapshot.data!) {
              return Chat_page(username: 'username');
            }else
              return LoginPage();
          }
          return CircularProgressIndicator();
        }
      )
    );
  }

}
