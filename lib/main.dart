import 'package:flutter/material.dart';
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
