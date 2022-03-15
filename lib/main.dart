import 'package:flutter/material.dart';
import 'package:surya_namaskar/frontpage.dart';
import 'package:surya_namaskar/posedetails.dart';
import 'package:surya_namaskar/salutation_step.dart';
import 'frontpage.dart';

//Need this to run the whole application
void main() {
  runApp(SuryaNamaskar());
}

class SuryaNamaskar extends StatelessWidget {
  const SuryaNamaskar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Surya Namaskar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xe4FF7722),
          secondary: const Color(0xffffffff),
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black54,
          displayColor: Colors.black87,
        ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          foregroundColor: Colors.white70,
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xc0FF7722),
          secondary: const Color(0xb0FF0000),
          surface: const Color(0xc0FF7722),
          onSecondary: const Color(0x8800ff00),
          brightness: Brightness.dark
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white38,
          displayColor: Colors.white70,
        ).copyWith(
          headline2: Theme.of(context).textTheme.headline2?.copyWith(
              color: Colors.black38,
          )
        ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
            foregroundColor: Colors.black38,
        )
      ),
      themeMode: ThemeMode.system,
      home: FrontPage()
    );
  }
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
          headline2: TextStyle(
            fontSize: 42.0,
            fontWeight: FontWeight.bold,
            color: Colors.black38
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
