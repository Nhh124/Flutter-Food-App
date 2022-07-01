// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key,
      required this.ImgUrl,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.id,
      required this.removeItem});

  final String id;
  final String ImgUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;
  String get ComplexityText {
    switch (complexity) {
      case Complexity.Simple:
        'Simple';
        break;
      case Complexity.Hard:
        'Hard';
        break;
      case Complexity.Challenging:
        'Challenging';
        break;
      default:
        'Unknown';
        break;
    }
    return toString();
  }

  String get AffordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        'Affordable';
        break;
      case Affordability.Luxurious:
        'Luxurious';
        break;
      case Affordability.Pricey:
        'Pricey';
        break;
      default:
        'Unknown';
        break;
    }
    return toString();
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((value) {
      if (value != null) {
        removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    ImgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(ComplexityText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(AffordabilityText)
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
