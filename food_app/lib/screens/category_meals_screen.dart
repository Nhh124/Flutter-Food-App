import 'package:flutter/material.dart';
import 'package:food_app/data/dummy_data.dart';

class CategoriesMealScreen extends StatelessWidget {
  const CategoriesMealScreen({
    super.key,
  });

  // final String categoryId;
  // final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(categoryMeal[index].title.toString());
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
