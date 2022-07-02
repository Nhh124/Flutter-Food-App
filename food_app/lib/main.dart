import 'dart:math';

import 'package:flutter/material.dart';
import './data/dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  /*Hàm lọc item trong danh sách
  
   */
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filter['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filter['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  /*Hàm lọc ra mục yêu thích
    existingIndex dò Mealid nếu không có trả về -1
    nếu có item thì xóa item tại exitstingIndex và ngược lại
  */
  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  /*Hàm kiểm tra item có nằm trong mục yêu thích không
    dùng id kiểm tra nếu có trong mục yêu thích trả về true/false
  */
  bool _isFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DeliMeals",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
          primaryColor: Colors.black,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: Theme.of(context).textTheme),

      //home: const CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeal: _favoriteMeals),
        CategoriesMealScreen.routeName: (ctx) => CategoriesMealScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, isFavorite: _isFavorite),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(saveFilters: _setFilters, currentFilter: _filter),
      },
    );
  }
}
