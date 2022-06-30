import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  static const routeName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Filter Screen!')),
    );
  }
}
