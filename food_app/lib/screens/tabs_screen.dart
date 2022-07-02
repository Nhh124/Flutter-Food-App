// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({
    super.key,
    required this.favoriteMeal,
  });

  List<Meal> favoriteMeal = [];

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _screens;
  int _selectedScreenIndex = 0;

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    _screens = [
      {
        'screen': const CategoryScreen(),
        'title': 'Categories',
      },
      {
        'screen': FavoritesScreen(favoriteMeal: widget.favoriteMeal),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_screens[_selectedScreenIndex]['title'].toString()),
        ),
        drawer: MainDrawer(),
        body: _screens[_selectedScreenIndex]['screen'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).colorScheme.background,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreenIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            const BottomNavigationBarItem(
                backgroundColor: Colors.pinkAccent,
                icon: Icon(Icons.category),
                label: "Categories"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.star), label: "Favorites"),
          ],
        ),
      ),
    );
  }
}
//Appbar Tab
// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meal'),
//           bottom: TabBar(tabs: [
//             Tab(
//               icon: Icon(Icons.category),
//               text: 'Categoryes',
//             ),
//             Tab(
//               icon: Icon(Icons.star),
//               text: 'Favorites',
//             )
//           ]),
//         ),
//         body: TabBarView(
//           children: [CategoryScreen(), FavoritesScreen()],
//         ),
//       ),
//     );
//   }
// }
