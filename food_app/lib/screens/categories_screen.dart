import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/data/dummy_data.dart';
import 'package:food_app/models/category.dart';
import './categories_screen.dart';
import 'package:food_app/widgets/categories_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: size.height * 0.4,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: size.height * .03,
            mainAxisSpacing: size.height * .03),
        children: DUMMY_CATEGORIES
            .map((data) => CategoryItem(
                  id: data.id,
                  title: data.title,
                  color: data.color,
                ))
            .toList(),
      ),
    );
  }
}
