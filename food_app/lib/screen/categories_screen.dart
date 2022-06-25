import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/data/dummy_data.dart';
import 'package:food_app/model/category.dart';
import './categories_screen.dart';
import 'package:food_app/widget/categories_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("DeliMeals"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: size.height * 0.4,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: size.height * .02,
            mainAxisSpacing: size.height * .02),
        children: DUMMY_CATEGORIES
            .map((data) => CategoryItem(title: data.title, color: data.color))
            .toList(),
      ),
    );
  }
}
