import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/welcom_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';
import 'screens/regist_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(); 
  
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       
      initialRoute:  WelcomScreen.id,
      routes: {
         WelcomScreen.id: (context) =>  const WelcomScreen(),
         LoginScreen.id: (context) => const LoginScreen(),
         RegistScreen.id: (context) => const RegistScreen(),
         ChatScreen.id: (context) =>  const ChatScreen(),
      },
    );
   
  }
}


