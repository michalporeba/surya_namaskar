import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Surya Namaskar')),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              FrontPageLabel(
                  text: '''Sun Salutations
(Surya Namaskar)
is a yoga based exercise'''
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Image(
                    image: AssetImage('images/symbol.png')),
              ),
              FrontPageLabel(text: 'You can use this app to'),
              FrontPageButton(isPrimary: false, label: 'learn more', onPressed: () => true),
              FrontPageLabel(text: 'or you can use to help you'),
              FrontPageButton(isPrimary: true, label: 'practice it', onPressed: () => true),
            ]
          )
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
        padding: EdgeInsets.all(12),
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
          padding: EdgeInsets.all(12),
          child: _button(
              isPrimary: isPrimary,
              onPressed: onPressed,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                    label,
                    style: Theme.of(context).textTheme.headline4),
              )
          )
    );
  }
}
