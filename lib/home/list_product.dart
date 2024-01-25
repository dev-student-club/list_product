import 'package:flutter/material.dart';
import 'package:list_product_json/data/product.dart';
import 'package:list_product_json/helpers/result_state.dart';
import 'package:list_product_json/providers/get_products_providers.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            _listProduct(context),
          ],
        ),
      ),
    );
  }

  // Widget to build the title of the screen
  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'List Product',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: 'serif',
        ),
      ),
    );
  }

  // Widget to display the list of products
  Widget _listProduct(BuildContext context) {
    return Consumer<GetProductsProvider>(builder: (context, provider, child) {
      switch (provider.state) {
        case ResultState.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case ResultState.hasData:
          return _buildProductList(provider.result.products ?? []);
        case ResultState.noData:
        case ResultState.error:
          return Center(child: Text(provider.message));
      }
    });
  }

  // Widget to build the list of products
  Widget _buildProductList(List<Product> data) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: _itemProduct(context, data[index]),
            onTap: () {
              // Assuming you have a DetailProduct widget to display details
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: '${data[index].id}',
              );
            },
          );
        },
      ),
    );
  }

  // Widget to build an individual product item
  Widget _itemProduct(BuildContext context, Product data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    data.thumbnail ?? '',
                    fit: BoxFit.fitHeight,
                    height: 120, // Adjust the height as needed
                    width: 160, // Adjust the width as needed
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Rating: ${data.rating}'),
                    Text('Stock: ${data.stock}'),
                    Text('Brand: ${data.brand}'),
                    Text('Category: ${data.category}'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
