import 'package:flutter/material.dart';
import 'common.dart';

class YogaButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final bool isPrimary;

  const YogaButton({
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