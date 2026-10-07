import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Погнали')),
      body: const SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.sports_soccer, size: 64),
                SizedBox(height: 16),
                Text('Найдём площадку для игры', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
