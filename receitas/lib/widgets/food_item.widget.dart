import 'package:flutter/material.dart';
import 'package:receitas/models/food.model.dart';
import 'package:receitas/pages/food_detail.page.dart';

class FoodItemWidget extends StatelessWidget {
  final FoodModel foodModel;
  final int position;

  const FoodItemWidget(
      {Key? key, required this.foodModel, required this.position})
      : super(key: key);

  _goToDetail(BuildContext context) {
    Navigator.pushNamed(
      context,
      FoodDetailPage.route,
      arguments:
          FoodDetailPageArguments(foodModel: foodModel, position: position),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToDetail(context),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        height: 160,
        width: double.infinity,
        color: Colors.grey,
        child: Stack(
          children: [
            Hero(
              tag: 'image_${position}_animation',
              child: Image.asset(
                'assets/images/position_${position}_image.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 25,
                        child: Center(
                          child: Text(
                            foodModel.type,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: foodModel.textColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: Text(
                          foodModel.name,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 23),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            foodModel.numberOfLikes.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.favorite,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            foodModel.numberOfComments.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.chat,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
