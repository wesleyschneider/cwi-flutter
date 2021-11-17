import 'package:flutter/material.dart';
import 'package:receitas/pages/food_list.page.dart';
import 'package:receitas/pages/food_detail.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: FoodListPage.route,
      routes: {
        FoodListPage.route: (context) => const FoodListPage(),
        FoodDetailPage.route: (context) => FoodDetailPage(
              args: ModalRoute.of(context)!.settings.arguments
                  as FoodDetailPageArguments,
            ),
      },
    );
  }
}
