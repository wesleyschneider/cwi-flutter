import 'package:dio/dio.dart';
import 'package:github_user_search/user_search/github_user.model.dart';

class GithubUserRepository {
  final Dio provider;

  GithubUserRepository(this.provider);

  Future<List<GithubUserModel>> searchByName(String name) async {
    try {
      if (name.trim() == '') {
        return <GithubUserModel>[];
      }

      final response =
          await provider.get('https://api.github.com/search/users?q=$name');

      final users = (response.data['items'] as List)
          .map((e) => GithubUserModel.fromJson(e))
          .toList();

      return users;
    } catch (e) {
      throw Exception('Erro ao pesquisar usuários');
    }
  }
}
