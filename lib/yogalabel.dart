import 'package:flutter/material.dart';
import 'common.dart';

class YogaLabel extends StatelessWidget {
  final String text;

  const YogaLabel({
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