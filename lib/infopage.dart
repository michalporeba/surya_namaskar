import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common.dart';
import 'yogabutton.dart';
import 'yogalabel.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('There be dragons!'),),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              (kReleaseMode) ? Container() : YogaLabel(text: 'This is the About Us or Contact Us page'),
              Padding(
                padding: const EdgeInsets.all(padding),
                child: SingleChildScrollView(
                  child: Text(
                      'This application has been created as part of the second coursework for CS306 module.',
                      style: Theme.of(context).textTheme.headline4),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(padding),
                child: SingleChildScrollView(
                  child: Text(
                      'Author: Michał Poręba\nStudent ID: 1915059',
                      style: Theme.of(context).textTheme.headline4),
                ),
              ),
              Spacer(),
              (kReleaseMode) ? Container() : YogaLabel(
                    text: 'Because the application is running\nin a pre-release mode, you can'),
              (kReleaseMode) ? Container() : YogaButton(isPrimary: true,
                    label: 'Reset configuration!',
                    onPressed: () {
                      SharedPreferences.getInstance().then((settings) {
                        settings.clear();
                        Navigator.pop(context);
                      });
                    }
              ),
            ]
        ),
      ),
    );
  }
}

