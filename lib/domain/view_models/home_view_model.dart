import 'package:salt/domain/view_models/post_view_model.dart';

class HomeViewModel {
  final int albumId;
  final int userId;
  final String name;
  final String url;
  final String thumbnailUrl;
  List<PostViewModel> postViewModels;

  HomeViewModel({
    required this.albumId,
    required this.userId,
    required this.name,
    required this.url,
    required this.thumbnailUrl,
    required this.postViewModels,
  });
}
