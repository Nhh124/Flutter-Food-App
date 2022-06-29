import 'package:flutter/material.dart';
import 'package:food_app/screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DeliMeals",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: Theme.of(context).textTheme),
      //home: const CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const CategoryScreen(),
        CategoriesMealScreen.routeName: (ctx) => CategoriesMealScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen()
      },
    );
  }
}
