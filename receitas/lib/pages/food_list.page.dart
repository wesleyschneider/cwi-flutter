import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receitas/models/food.model.dart';
import 'package:receitas/utils/color.util.dart';
import 'package:receitas/widgets/food_item.widget.dart';

class FoodListPage extends StatefulWidget {
  static const String route = 'first_page';

  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<FoodModel> foodModelList = [
    FoodModel(
      type: 'Appetizer',
      numberOfComments: 21,
      numberOfLikes: 201,
      name: 'Spinach & chicken Salad',
      textColor: ColorUtils.position1TextColor,
    ),
    FoodModel(
      type: 'First dish',
      numberOfComments: 19,
      numberOfLikes: 601,
      name: 'Crackers with salmon',
      textColor: ColorUtils.position2TextColor,
    ),
    FoodModel(
      type: 'Dessert',
      numberOfComments: 121,
      numberOfLikes: 5400,
      name: 'Chocolate cake',
      textColor: ColorUtils.position3TextColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.regularBackground,
        title: const Text('Delicious'),
      ),
      body: Container(
        color: ColorUtils.regularBackground,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (_, int position) {
            return FoodItemWidget(
              position: position + 1,
              foodModel: foodModelList[position],
            );
          },
        ),
      ),
    );
  }
}
