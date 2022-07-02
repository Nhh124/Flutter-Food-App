import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoriesMealScreen extends StatefulWidget {
  const CategoriesMealScreen({
    super.key,
    required this.availableMeals,
  });
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  @override
  State<CategoriesMealScreen> createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  // final String categoryId;
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'].toString();
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title.toString(),
            ImgUrl: displayedMeals[index].imageUrl.toString(),
            affordability: displayedMeals[index].affordability,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            // removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
