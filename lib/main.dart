import 'package:flash_chat/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(const FlashChat());

void main() {

  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     bodyText1: TextStyle(color: Colors.black54),
      //   ),
      // ),
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return snapshot.error;
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: WelcomeScreen.id,
            routes: {
              WelcomeScreen.id: (context) => WelcomeScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen(),
              ChatScreen.id: (context) => ChatScreen(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete

        print("Critical Initialization while initializing app lolz");
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Container(

            color: Colors.black,
            child: TextButton(

              onPressed: () {

              },

              child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: new Text('Loading')),
            ),
          ),
        );
     },
    );



  }
}
