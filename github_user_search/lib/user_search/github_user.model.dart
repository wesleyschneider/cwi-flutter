class GithubUserModel {
  final int id;
  final String login;
  final String avatarUrl;
  final String url;

  GithubUserModel({
    required this.id,
    required this.login,
    required this.avatarUrl,
    required this.url,
  });

  factory GithubUserModel.fromJson(Map<String, dynamic> json) =>
      GithubUserModel(
        id: json['id'],
        login: json['login'],
        avatarUrl: json['avatar_url'],
        url: json['url'],
      );
}
