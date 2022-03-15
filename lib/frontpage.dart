import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'learnpage.dart';
import 'optionspage.dart';
import 'warningpage.dart';
import 'yogabutton.dart';
import 'common.dart';
import 'yogalabel.dart';
import 'infopage.dart';

/// First page after opening of the application
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
      onPressed: () {
        SharedPreferences.getInstance().then((settings) {
          bool acceptedRisk = settings.getBool(SETTINGS_ACCEPTED_RISK) ?? false;
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => acceptedRisk ? const OptionsPage() : const WarningPage()
          ));
        });
      }
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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const InfoPage()));
                  },
                  child: Icon(Icons.info, color: Theme.of(context).appBarTheme.foregroundColor)
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
