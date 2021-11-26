class UserInfoModel {
  final int id;
  final String avatarUrl;
  final String login;
  final int repos;
  final int followers;
  final int following;

  UserInfoModel({
    required this.id,
    required this.avatarUrl,
    required this.login,
    required this.repos,
    required this.followers,
    required this.following,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        id: json['id'],
        avatarUrl: json['avatar_url'],
        login: json['login'],
        repos: json['public_repos'],
        followers: json['followers'],
        following: json['following'],
      );
}
