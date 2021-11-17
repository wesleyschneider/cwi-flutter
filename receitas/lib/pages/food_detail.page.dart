import 'package:flutter/material.dart';
import 'package:receitas/models/food.model.dart';
import 'package:receitas/utils/color.util.dart';
import 'package:receitas/widgets/ingredient_item.widget.dart';

class FoodDetailPageArguments {
  final FoodModel foodModel;
  final int position;

  FoodDetailPageArguments({required this.foodModel, required this.position});
}

class FoodDetailPage extends StatefulWidget {
  static const String route = 'second_page';
  final FoodDetailPageArguments args;

  const FoodDetailPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.regularBackground,
      ),
      body: Container(
        height: double.infinity,
        alignment: Alignment.topCenter,
        color: ColorUtils.regularBackground,
        child: Column(
          children: [
            Hero(
              tag: 'image_${widget.args.position}_animation',
              child: Image.asset(
                  'assets/images/position_${widget.args.position}_image.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.args.foodModel.name,
                style: const TextStyle(color: Colors.white, fontSize: 23),
              ),
            ),
            Text(
              'Autor: John Smith',
              style: TextStyle(
                color: ColorUtils.secondaryColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 50),
            const IngredientItemWidget(name: 'Chicken Breast'),
            const IngredientItemWidget(name: 'Spinach'),
            const IngredientItemWidget(name: 'Pomegranate')
          ],
        ),
      ),
    );
  }
}
