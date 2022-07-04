import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.favoriteMeal});
  final List<Meal> favoriteMeal;
  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("This no favorites meal")),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoriteMeal[index].id,
            title: favoriteMeal[index].title.toString(),
            ImgUrl: favoriteMeal[index].imageUrl.toString(),
            affordability: favoriteMeal[index].affordability,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
