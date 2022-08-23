import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salt/resources/screen_values.dart';
import 'package:salt/salt_app.dart';
import 'package:salt/service/navigation_service.dart';
import 'package:salt/state.dart';
import 'package:salt/ui/page/home_page.dart';

class SplashPage extends ConsumerWidget {
  static const String id = "SplashPage";

  const SplashPage({Key? key}) : super(key: key);

  void _getData(WidgetRef ref) async {
    await ref.read(mainProvider).init();
    _goToNextPage();
  }

  void _goToNextPage() {
    NavigationService().pushReplacement(const HomePage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _getData(ref);
    var textColor = Theme.of(context).colorScheme.onBackground;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: textColor,
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenValues.paddingNormal),
              child: Text(
                AppLocalizations.of(context)?.loading ?? "",
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
