import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/src/data/local/data.dart';
import 'package:shopping/src/provider/cart_provider.dart';
import 'package:shopping/src/screen/cart_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Order App"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: DUMMY_PRODUCTS.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(DUMMY_PRODUCTS[i]['title'] as String),
          subtitle: Text('\$${DUMMY_PRODUCTS[i]['price']}'),
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Provider.of<Cart>(context, listen: false).addItem(
                DUMMY_PRODUCTS[i]['id'] as String,
                DUMMY_PRODUCTS[i]['price'] as double,
                DUMMY_PRODUCTS[i]['title'] as String,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Added To Cart"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
