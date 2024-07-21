import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/src/provider/cart_provider.dart';
import 'package:shopping/src/screen/product_list_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Order App',
      home: const ProductListScreen(),
    );
  }
}
