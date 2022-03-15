import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common.dart';
import 'yogabutton.dart';
import 'practicepage.dart';


class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  late int repetitions = 1;
  late int duration = 12;
  late bool breathing = false;
  
  @override 
  void initState() {
    super.initState();
    print('initialising state');
    SharedPreferences.getInstance().then((settings) {
      print('I now have the settings');
      print('Cycles = ${settings.getInt(SETTINGS_REPETITIONS)}');
      setState(() {
        repetitions = settings.getInt(SETTINGS_REPETITIONS) ?? 1;
        duration = settings.getInt(SETTINGS_DURATION) ?? 12;
        breathing = settings.getBool(SETTINGS_HELP_ME_BREATHE) ?? false;
      });
    }).onError((error, stackTrace) {
      print('ERROR $error');
      return null;
    });
  }

  @override
  void dispose() {
    _saveSettings();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Practice parameters'),),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(padding),
                  child: SingleChildScrollView(
                    child: Text('Number of repetitions',
                        style: Theme.of(context).textTheme.headline4),
                  ),
                ),
                Padding(
                  child: SpinBox(
                    value: repetitions.toDouble(),
                    onChanged: (value) => repetitions = value.toInt(),
                    readOnly: false,
                    textStyle: Theme.of(context).textTheme.headline3,
                    min: 1,
                    max: 108,
                  ),
                  padding: const EdgeInsets.all(padding),
                ),
                Padding(
                  padding: const EdgeInsets.all(padding),
                  child: SingleChildScrollView(
                    child: Text('Seconds for each pose',
                        style: Theme.of(context).textTheme.headline4),
                  ),
                ),
                Padding(
                  child: SpinBox(
                    value: duration.toDouble(),
                    onChanged: (value) => duration = value.toInt(),
                    readOnly: false,
                    textStyle: Theme.of(context).textTheme.headline3,
                    min: 5,
                    max: 60,
                  ),
                  padding: const EdgeInsets.all(padding),
                ),
                Option(text: 'Help me breathe', onChanged: (value) => breathing = value),
                Spacer(),
                YogaButton(isPrimary: true,
                    label: 'Now, do yoga!',
                    onPressed: () => _setAndStart(context)),
              ]
          ),
        ),
    );
  }

  void _setAndStart(BuildContext context) {
    _saveSettings();
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const PracticePage()
    ));
  }

  void _saveSettings() {
    SharedPreferences.getInstance().then((settings) {
      settings.setInt(SETTINGS_REPETITIONS, repetitions);
      settings.setInt(SETTINGS_DURATION, duration);
      settings.setBool(SETTINGS_HELP_ME_BREATHE, breathing);
    });

  }
}

class Option extends StatefulWidget {
  final String text;
  final Function(bool) onChanged;

  const Option({required this.text, required this.onChanged, Key? key}) : super(key: key);

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  bool currentValue = false;

  @override
  void initState() {
    SharedPreferences.getInstance().then((settings) {
      currentValue = settings.getBool(SETTINGS_HELP_ME_BREATHE) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Padding(
              padding: const EdgeInsets.all(padding),
              child: SingleChildScrollView(
                child: Text('Help me breathe',
                    style: Theme.of(context).textTheme.headline4),
              )
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(padding),
            child: Switch(
              value: currentValue,
              activeColor: const Color(0xc0FF7722),
              onChanged: (bool value) {
                setState(() { currentValue = value; });
                widget.onChanged(value);
              }
            ),
          )
        ]
    );
  }
}
