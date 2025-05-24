import 'package:flutter/material.dart';
import 'package:learning/ChatPage.dart';
import 'package:learning/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
   final _formkey = GlobalKey<FormState>();
 Future<void> LoginUser (BuildContext context)async{
    if(_formkey.currentState!=null && _formkey.currentState!.validate()) {
      print(userNameController.text);

      await context.read<AuthService>().loginUser(userNameController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Chat_page(username: userNameController.text,)));
    }else{
      print('not successful');
    }
  }
final userNameController = TextEditingController();
   final passWordController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,title: Text('Welcome to noteskeeper',textAlign: TextAlign.center,),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Text('Let\'s sign you in',style: TextStyle(fontSize: 30,color: Colors.blue,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        Center(
          child: Text('welcome back \n you\'ve been missed',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.blue),textAlign: TextAlign.center,),
        ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!=null && value.isNotEmpty && value.length < 5){
                        return "Your username should be more than five characters";
                      }else if(value!=null && value.isEmpty){
                        return "please type your username";
                      }
                      return null;
                    },
                    controller: userNameController,
                    decoration: InputDecoration(
                        hintText: 'Username',
                         hintStyle: TextStyle(color: Colors.blue),
                      border: OutlineInputBorder(
                  )

                         ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextFormField(
                    controller: passWordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),

 Padding(
   padding: const EdgeInsets.all(24.0),
   child: ElevatedButton(onPressed: ()async{
                await LoginUser(context);
              }, child: Text('Login',style: TextStyle(fontSize: 30 ),)),
 ),
        ],

      ),

    );
  }
}
