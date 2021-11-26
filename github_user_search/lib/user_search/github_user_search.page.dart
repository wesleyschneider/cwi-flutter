import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_user_search/user_search/github_user.model.dart';
import 'package:github_user_search/user_search/github_user.repository.dart';
import 'package:github_user_search/user_search/user_list_item.widget.dart';

class GithubUserSearch extends StatefulWidget {
  static String route = 'user_search';

  const GithubUserSearch({Key? key}) : super(key: key);

  @override
  _GithubUserSearchState createState() => _GithubUserSearchState();
}

class _GithubUserSearchState extends State<GithubUserSearch> {
  final GithubUserRepository repository = GithubUserRepository(Dio());

  List<GithubUserModel> users = [];
  String? searchText;

  _onSearchPressed() async {
    users = await repository.searchByName(searchText ?? '');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            TextFormField(
              onFieldSubmitted: (_) => _onSearchPressed(),
              onChanged: (text) {
                setState(() {
                  searchText = text;
                });
              },
              decoration: InputDecoration(
                labelText: 'Github login',
                suffixIcon: IconButton(
                  onPressed: _onSearchPressed,
                  icon: const Icon(Icons.search),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: users.length,
                separatorBuilder: (_, __) => const Divider(color: Colors.black),
                itemBuilder: (_, int index) =>
                    UserListItem(model: users[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
