import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unscramble/my_home_page.dart';
import 'package:unscramble/unscramble_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UnscrambleModel(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SafeArea(child: MyHomePage()),
    );
  }
}


