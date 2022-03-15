import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'yogabutton.dart';
import 'common.dart';

/// Page displayed after completing a full exercise
class EndPage extends StatelessWidget {
  const EndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Well done!'),),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(padding),
                child: SingleChildScrollView(
                  child: Text('You have finished the exercise! Hopefully you have relaxed '
                      'and are ready to go back to whatever stress you out.',
                      style: Theme.of(context).textTheme.headline4),
                ),
              ),
              Spacer(),
              YogaButton(isPrimary: true,
                  label: 'Now... go away!',
                  onPressed: () => SystemNavigator.pop()),
            ]
        ),
      ),
    );
  }
}