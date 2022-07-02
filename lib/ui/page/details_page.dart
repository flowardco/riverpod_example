import 'package:flutter/material.dart';
import 'package:salt/domain/view_models/home_view_model.dart';
import 'package:salt/resources/screen_values.dart';
import 'package:salt/ui/widget/detail_data_widget.dart';

class DetailsPage extends StatelessWidget {
  static const String id = "DetailsPage";
  final HomeViewModel homeViewModel;
  const DetailsPage({Key? key, required this.homeViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: ScreenValues.imageLarge,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(homeViewModel.name),
              background: Hero(
                tag: homeViewModel.name,
                child: Image.network(
                  homeViewModel.thumbnailUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var item = homeViewModel.postViewModels[index];

                return DetailDataWidget(
                  key: Key(item.id.toString()),
                  title: item.title,
                  body: item.body,
                );
              },
              childCount: homeViewModel.postViewModels.length,
            ),
          ),
        ],
      ),
    );
  }
}
