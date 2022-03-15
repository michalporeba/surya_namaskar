import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'optionspage.dart';
import 'yogabutton.dart';
import 'yogalabel.dart';
import 'common.dart';

class WarningPage extends StatelessWidget {
  const WarningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('There be dragons!'),),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Padding(
                padding: const EdgeInsets.all(padding),
                child: SingleChildScrollView(
                  child: Text('Be careful! The author of this app has no practical knowledge of yoga! '
                      'For all he knows, following those instructions might result in serious injury. '
                      'If you decide to progress to the next screen, you are on your own. Good luck!',
                  style: Theme.of(context).textTheme.headline4),
                ),
              ),
              Spacer(),
              YogaLabel(text: 'I understand that in common law\nto a willing person, injury is not done.'),
              YogaButton(isPrimary: true,
                  label: 'Volenti non fit injuria',
                  onPressed: () => _acceptTheRisk(context)),
            ]
          ),
        ),
    );
  }

  void _acceptTheRisk(BuildContext context) {
    SharedPreferences.getInstance().then((settings) {
      settings.setBool(SETTINGS_ACCEPTED_RISK, true);
    });
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const OptionsPage()
    ));
  }
}