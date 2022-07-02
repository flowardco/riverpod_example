enum Routes {
  posts,
  users,
}

extension StaticRoutes on Routes {
  static const _url = {
    Routes.posts: "SharminSirajudeen/test_resources/posts",
    Routes.users: "SharminSirajudeen/test_resources/users",
  };

  String get url => _url[this] ?? "";
}
