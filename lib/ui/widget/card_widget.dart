import 'package:flutter/material.dart';
import 'package:salt/resources/screen_values.dart';

class CardWidget extends StatelessWidget {
  final Widget child;

  const CardWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenValues.radiusNormal),
        ),
      ),
      child: child,
    );
  }
}
