import 'package:flutter/material.dart';

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
  Widget _learnButton() => FrontPageButton(isPrimary: false, label: 'learn more', onPressed: () => true);
  Widget _practicePrompt() => FrontPageLabel(text: 'or you can use the app to help you');
  Widget _practiceButton() => FrontPageButton(isPrimary: true, label: 'practice it', onPressed: () => true);

  Widget _portrait() => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        _introduction(),
        _symbol(),
        _learnPrompt(),
        _learnButton(),
        _practicePrompt(),
        _practiceButton()
      ]
  );

  Widget _landscape() => Row(
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
                      _learnButton(),
                      _practicePrompt(),
                      _practiceButton()
                    ]
                ),
            ),
            ),
        ]
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Surya Namaskar')),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
              ? _portrait()
              : _landscape();
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
