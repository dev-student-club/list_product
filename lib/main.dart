import 'package:flutter/material.dart';
import 'package:list_product_json/data/api/api_service.dart';
import 'package:list_product_json/detail/product_detail.dart';
import 'package:list_product_json/home/list_product.dart';
import 'package:list_product_json/providers/get_products_providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => GetProductsProvider(apiService: ApiService()),
        child: MaterialApp(
          theme: ThemeData(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          initialRoute: '/home',
          routes: {
            '/home': (context) => const ListProduct(),
            '/detail': (context) {
              final arguments = ModalRoute.of(context)?.settings.arguments;
              if (arguments is String) {
                return ProductDetail(id: arguments);
              } else {
                // Handle the case when arguments are not of type Product
                // You can navigate to an error page or handle it in another way
                return Scaffold(appBar: AppBar(), body: Container());
              }
            },
          },
        ));
  }
}
