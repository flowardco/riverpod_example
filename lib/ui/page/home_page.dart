import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salt/provider/main_provider.dart';
import 'package:salt/resources/screen_values.dart';
import 'package:salt/salt_app.dart';
import 'package:salt/service/navigation_service.dart';
import 'package:salt/ui/page/details_page.dart';
import 'package:salt/ui/widget/app_bar_widget.dart';
import 'package:salt/ui/widget/home_data_card.dart';

class HomePage extends StatelessWidget {
  static const String id = "HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key(id),
      appBar: AppBarWidget(title: AppLocalizations.of(context)?.appName ?? ""),
      body: SafeArea(
        child: Consumer<MainProvider>(
          builder: (context, mainProvider, child) => ListView.separated(
            padding: EdgeInsets.all(ScreenValues.paddingSmall),
            itemBuilder: (context, index) {
              var item = mainProvider.homeItems[index];
              return HomeDataCard(
                key: Key(item.userId.toString()),
                userName: item.name,
                thumbnail: item.thumbnailUrl,
                postTotalCount: item.postViewModels.length,
                onTap: () {
                  NavigationService().push(DetailsPage(homeViewModel: item));
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: ScreenValues.paddingSmall,
            ),
            itemCount: mainProvider.homeItems.length,
          ),
        ),
      ),
    );
  }
}
