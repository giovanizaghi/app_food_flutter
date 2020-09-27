import 'package:app_food_flutter/components/mainDrawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configurações")),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Configurações"),
      ),
    );
  }
}
