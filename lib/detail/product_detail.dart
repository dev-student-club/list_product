import 'package:flutter/material.dart';
import 'package:list_product_json/data/api/api_service.dart';
import 'package:list_product_json/data/product.dart';
import 'package:list_product_json/providers/get_detail_product_providers.dart';
import 'package:list_product_json/providers/get_products_providers.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  final String id;

  const ProductDetail({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetDetailProductProvider>(
      create: (context) =>
          GetDetailProductProvider(id, apiService: ApiService()),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Product Detail',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'serif',
              ),
            ),
          ),
          body: Consumer<GetDetailProductProvider>(
            builder: (context, value, _) {
              switch (value.state) {
                case ResultState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ResultState.hasData:
                  return _buildContent(context, value.product);
                case ResultState.noData:
                case ResultState.error:
                  return Center(child: Text(value.message));
              }
            },
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _buildContent(BuildContext context, Product product) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.thumbnail ?? '',
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height / 4,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.title ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Brand: ${product.brand}'),
            Text('Category: ${product.category}'),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.star_outlined,
                      color: Colors.yellow[700],
                    ),
                    const Text('Rating'),
                    Text(product.rating.toString()),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    const Icon(
                      Icons.smartphone_rounded,
                      color: Colors.blue,
                    ),
                    const Text('Stock'),
                    Text(product.stock.toString()),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    const Icon(
                      Icons.attach_money_rounded,
                      color: Colors.green,
                    ),
                    const Text('Price'),
                    Text('\$${product.stock}'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(product.description ?? ''),
            const SizedBox(height: 16),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.images?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product.images?[index] ?? '',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
