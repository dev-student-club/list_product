import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:list_product_json/data/product.dart';
import 'package:list_product_json/detail/product_detail.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'List \nProduct',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                  ),
                ),
              ),
              _listProduct(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listProduct(BuildContext context) {
    return FutureBuilder(
      future: _fetchProduct(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<Product> data = snapshot.data!;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: _itemProduct(context, data[index]),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ProductDetail(data[index]);
                    },
                  ));
                },
              );
            },
          );
        }
      },
    );
  }

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
                    data.thumbnail,
                    fit: BoxFit.fitHeight,
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
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

  Future<List<Product>> _fetchProduct(BuildContext context) async {
    final jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/local_data.json');
    final jsonResult = jsonDecode(jsonString);
    final data = List<Product>.from(jsonResult['products'].map(
      (item) => Product.fromJson(item),
    ));

    return data;
  }
}
