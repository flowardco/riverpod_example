enum HttpRequestType {
  get,
  post,
  put,
  update,
  patch,
  delete,
}

extension StaticHttpRequestType on HttpRequestType {
  static const _type = {
    HttpRequestType.get: "GET",
    HttpRequestType.post: "POST",
    HttpRequestType.put: "PUT",
    HttpRequestType.update: "UPDATE",
    HttpRequestType.patch: "PATH",
    HttpRequestType.delete: "DELETE",
  };

  String get type => _type[this] ?? "";
}
