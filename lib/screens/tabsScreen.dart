import 'package:app_food_flutter/components/mainDrawer.dart';
import 'package:app_food_flutter/models/meal.dart';
import 'package:app_food_flutter/screens/favoriteScreen.dart';
import 'package:flutter/material.dart';
import 'categoriesScreen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: themeContext.accentColor,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        type: BottomNavigationBarType.fixed,
        backgroundColor: themeContext.primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: themeContext.primaryColor,
            icon: Icon(Icons.category),
            label: "Categorias",
          ),
          BottomNavigationBarItem(
            backgroundColor: themeContext.primaryColor,
            icon: Icon(Icons.star),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}
