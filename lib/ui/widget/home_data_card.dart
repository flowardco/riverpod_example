import 'package:flutter/material.dart';
import 'package:salt/resources/screen_values.dart';
import 'package:salt/salt_app.dart';
import 'package:salt/ui/widget/card_widget.dart';

class HomeDataCard extends StatelessWidget {
  final String userName;
  final String thumbnail;
  final int postTotalCount;
  final Function() onTap;

  const HomeDataCard({
    Key? key,
    required this.onTap,
    required this.userName,
    required this.thumbnail,
    required this.postTotalCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenValues.radiusNormal),
        ),
        child: Padding(
          padding: EdgeInsets.all(ScreenValues.paddingSmall),
          child: Row(
            children: [
              ClipOval(
                child: Hero(
                  tag: userName,
                  child: Image.network(
                    thumbnail,
                    width: ScreenValues.imageNormal,
                    height: ScreenValues.imageNormal,
                  ),
                ),
              ),
              SizedBox(width: ScreenValues.paddingNormal),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: ScreenValues.paddingSmall),
                    Text(
                      "${AppLocalizations.of(context)?.postCount ?? ""} : $postTotalCount",
                    ),
                  ],
                ),
              ),
              const Icon(Icons.play_arrow_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
