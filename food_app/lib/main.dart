import 'package:flutter/material.dart';
import 'package:food_app/screen/categories_screen.dart';
import 'package:food_app/screen/category_meals_screen.dart';

import 'screen/home_screen.dart';

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
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: Theme.of(context).textTheme),
      home: const CategoryScreen(),
      routes: {'/category-meals': (ctx) => CategoriesMealScreen()},
    );
  }
}
