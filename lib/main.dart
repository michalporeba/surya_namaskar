import 'package:flutter/material.dart';
import 'package:surya_namaskar/posedetails.dart';
import 'package:surya_namaskar/salutation_step.dart';

//Need this to run the whole application
void main() {
  runApp(SNApp());
}

//Starter Widget which contains everything else
class SNApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Surya Namaskar',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[00],
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          headline6: TextStyle(
            fontSize: 32.0,
            fontStyle: FontStyle.italic,
          ),
          bodyText2: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Arial',
          ),
        ),
      ),
      //the Salutation Page consists of all the poses and the
      //buttons to navigate between them.
      home: SalutationPage(
        poseList: PoseList(),
      ),
    );
  }
}
