import 'package:flutter/material.dart';
import 'package:list_product_json/data/product.dart';
import 'package:list_product_json/detail/product_detail.dart';
import 'package:list_product_json/home/list_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const ListProduct(),
        '/detail': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is Product) {
            return ProductDetail(product: arguments);
          } else {
            // Handle the case when arguments are not of type Product
            // You can navigate to an error page or handle it in another way
            return Container();
          }
        },
      },
    );
  }
}
