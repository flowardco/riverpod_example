import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salt/provider/main_provider.dart';
import 'package:salt/resources/screen_values.dart';
import 'package:salt/salt_app.dart';
import 'package:salt/service/navigation_service.dart';
import 'package:salt/ui/page/home_page.dart';

class SplashPage extends StatefulWidget {
  static const String id = "SplashPage";

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    await context.read<MainProvider>().init();
    _goToNextPage();
  }

  void _goToNextPage() {
    NavigationService().pushReplacement(const HomePage());
  }

  @override
  Widget build(BuildContext context) {
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
