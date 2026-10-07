import 'package:flutter/material.dart';
import 'package:pognali/app/router.dart';

class PognaliApp extends StatelessWidget {
  const PognaliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Погнали',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3157D5)),
        useMaterial3: true,
      ),
    );
  }
}
