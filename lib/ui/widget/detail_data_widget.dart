import 'package:flutter/material.dart';
import 'package:salt/resources/screen_values.dart';
import 'package:salt/ui/widget/card_widget.dart';

class DetailDataWidget extends StatelessWidget {
  final String title;
  final String body;

  const DetailDataWidget({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainTheme = Theme.of(context).textTheme.bodyText1;
    return CardWidget(
      child: Padding(
        padding: EdgeInsets.all(ScreenValues.paddingNormal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: mainTheme?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: ScreenValues.paddingSmall),
            Text(
              body,
              style: mainTheme,
            ),
          ],
        ),
      ),
    );
  }
}
