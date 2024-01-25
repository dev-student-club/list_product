import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:list_product_json/data/product.dart';

class ApiService {
  // Base URL for the API
  static const String _baseUrl = 'https://dummyjson.com/';

  // Headers for handling CORS (Cross-Origin Resource Sharing)
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
  };

  // Fetch all products from the API
  Future<BaseProductResponse> getProduct() async {
    // Make a GET request to retrieve the list of products
    final response =
        await http.get(Uri.parse('$_baseUrl/products'), headers: headers);

    // Check if the response status code is 200 (OK)
    if (response.statusCode == 200) {
      // If successful, parse the response body and return it
      return BaseProductResponse.fromJson(json.decode(response.body));
    } else {
      // If unsuccessful, throw an exception with an error message
      throw Exception('Failed to load list product');
    }
  }

  // Fetch details of a specific product by ID
  Future<Product> getDetailProduct(String id) async {
    // Make a GET request to retrieve the details of a specific product
    final response =
        await http.get(Uri.parse('$_baseUrl/products/$id'), headers: headers);

    // Check if the response status code is 200 (OK)
    if (response.statusCode == 200) {
      // If successful, parse the response body and return it
      return Product.fromJson(json.decode(response.body));
    } else {
      // If unsuccessful, throw an exception with an error message
      throw Exception('Failed to load list product');
    }
  }
}
