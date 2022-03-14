import 'package:flutter/material.dart';
import 'package:surya_namaskar/learnpage.dart';
import 'package:surya_namaskar/practicepage.dart';
import 'warningpage.dart';
import 'yogabutton.dart';
import 'common.dart';
import 'yogalabel.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  Widget _introduction() => YogaLabel(
      text: '''Sun Salutations
(Surya Namaskar)
is a yoga based exercise'''
  );

  Widget _symbol() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding*2, vertical: padding),
      child: Image(
          image: AssetImage('images/symbol.png'))
    );

  Widget _learnPrompt() => YogaLabel(text: 'You can always');
  Widget _learnButton(BuildContext context) => YogaButton(
      isPrimary: false,
      label: 'learn more',
      onPressed: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) => const LearnPage()
      ))
  );
  Widget _practicePrompt() => YogaLabel(text: 'or you can use the app to help you');
  Widget _practiceButton(BuildContext context) => YogaButton(
      isPrimary: true,
      label: 'practice it',
      onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => const WarningPage()
      ))
  );

  Widget _portrait(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        _introduction(),
        _symbol(),
        _learnPrompt(),
        _learnButton(context),
        _practicePrompt(),
        _practiceButton(context)
      ]
  );

  Widget _landscape(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FittedBox(
              child: _symbol(),
            )
          ),
          Divider(),
          Expanded(
            child: FittedBox(
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _introduction(),
                      _learnButton(context),
                      _practicePrompt(),
                      _practiceButton(context)
                    ]
                ),
            ),
            ),
        ]
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Surya Namaskar'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding),
              child: TextButton(
                  onPressed: () => true,
                  child: Icon(Icons.settings)
              ),
            )
          ],
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
              ? _portrait(context)
              : _landscape(context);
          }
        ),
      ),
    );
  }
}
