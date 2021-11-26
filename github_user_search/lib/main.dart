import 'package:flutter/material.dart';
import 'package:github_user_search/user_info/user_info.page.dart';
import 'package:github_user_search/user_search/github_user_search.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github User Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: GithubUserSearch.route,
      routes: {
        GithubUserSearch.route: (_) => const GithubUserSearch(),
        UserInfoPage.route: (context) => UserInfoPage(
              args: ModalRoute.of(context)?.settings.arguments
                  as UserInfoPageArgs,
            ),
      },
    );
  }
}
