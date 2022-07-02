import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {super.key, required this.saveFilters, required this.currentFilter});

  static const routeName = '/filter';
  final Function saveFilters;
  final Map<String, bool> currentFilter;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten']!;
    _vegan = widget.currentFilter['vegan']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    _lactoseFree = widget.currentFilter['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTitle(
    String title,
    bool value,
    String subtitle,
    Function(bool) valueChange,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: valueChange,
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filter"), actions: [
        IconButton(
          onPressed: () {
            final selectedFilter = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilter);
          },
          icon: Icon(Icons.save),
        ),
      ]),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Aujust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTitle(
                "Gluten-Free",
                _glutenFree,
                "Only include gluten-free meals",
                (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTitle(
                "Lactose-Free",
                _lactoseFree,
                "Only include Lactose-free meals",
                (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTitle(
                "Vetetarian",
                _vegetarian,
                "Only include vetetarian meals",
                (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTitle(
                "Vegan",
                _vegan,
                "Only include vegan meals",
                (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
