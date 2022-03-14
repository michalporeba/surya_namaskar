import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'common.dart';
import 'yogalabel.dart';
import 'yogabutton.dart';
import 'practicepage.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({Key? key}) : super(key: key);

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
                    child: Text('Number of cycles',
                        style: Theme.of(context).textTheme.headline4),
                  ),
                ),
                Padding(
                  child: SpinBox(
                    value: 10,
                    readOnly: false,
                    textStyle: Theme.of(context).textTheme.headline2,
                    min: 1,
                    max: 108,
                  ),
                  padding: const EdgeInsets.all(16),
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
                    value: 10,
                    readOnly: false,
                    textStyle: Theme.of(context).textTheme.headline2,
                    min: 5,
                    max: 60,
                  ),
                  padding: const EdgeInsets.all(16),
                ),
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
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const PracticePage()
    ));
  }
}
