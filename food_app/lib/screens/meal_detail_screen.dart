import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        child: Text("$mealId!"),
      ),
    );
  }
}
