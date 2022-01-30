import 'package:flutter/material.dart';
import 'package:surya_namaskar/learnpage.dart';
import 'package:surya_namaskar/practicepage.dart';

const double padding = 12.0;

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  Widget _introduction() => FrontPageLabel(
      text: '''Sun Salutations
(Surya Namaskar)
is a yoga based exercise'''
  );

  Widget _symbol() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding*2, vertical: padding),
      child: Image(
          image: AssetImage('images/symbol.png'))
    );

  Widget _learnPrompt() => FrontPageLabel(text: 'You can always');
  Widget _learnButton(BuildContext context) => FrontPageButton(
      isPrimary: false,
      label: 'learn more',
      onPressed: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) => const LearnPage()
      ))
  );
  Widget _practicePrompt() => FrontPageLabel(text: 'or you can use the app to help you');
  Widget _practiceButton(BuildContext context) => FrontPageButton(
      isPrimary: true,
      label: 'practice it',
      onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => const PracticePage()
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


class FrontPageLabel extends StatelessWidget {
  final String text;

  const FrontPageLabel({
    required this.text,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding/2),
        child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6
        )
      )
    );
  }
}


class FrontPageButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final bool isPrimary;

  const FrontPageButton({
    required this.isPrimary,
    required this.label,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  Widget _button({
    required bool isPrimary,
    required void Function() onPressed,
    required Widget child
  }) {
    return isPrimary
        ? ElevatedButton(onPressed: onPressed, child: child,)
        : OutlinedButton(onPressed: onPressed, child: child);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(padding),
          child: _button(
              isPrimary: isPrimary,
              onPressed: onPressed,
              child: Padding(
                padding: const EdgeInsets.all(padding),
                child: Text(
                    label,
                    style: Theme.of(context).textTheme.headline4),
              )
          )
    );
  }
}
