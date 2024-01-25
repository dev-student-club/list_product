import 'package:flutter/material.dart';
import 'package:list_product_json/data/api/api_service.dart';
import 'package:list_product_json/data/product.dart';
import 'package:list_product_json/helpers/result_state.dart';

class GetDetailProductProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  late Product _product;
  ResultState _state = ResultState.loading;
  String _message = '';

  // Getters for external access
  String get message => _message;
  Product get product => _product;
  ResultState get state => _state;

  // Constructor to initialize the provider with the product ID and API service
  GetDetailProductProvider(this.id, {required this.apiService}) {
    // Initiate the fetch of detailed product information when the provider is created
    _fetchDetailProducts(id);
  }

  // Private method to fetch detailed product information based on the provided ID
  Future<void> _fetchDetailProducts(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      // Request product details from the API service
      final result = await apiService.getDetailProduct(id);

      // Check if the received product details are valid
      if ((result.title != '' &&
          result.title != '' &&
          result.brand != '' &&
          result.category != '' &&
          result.discountPercentage != 0.0 &&
          result.price != 0)) {
        // Update the state and product with the received details
        _state = ResultState.hasData;
        notifyListeners();
        _product = result;
      } else {
        // Update the state and message when no valid results are found
        _state = ResultState.noData;
        notifyListeners();
        _message = 'No results found by id:$id';
      }
    } catch (e) {
      // Handle errors during the API request and update the state and message
      _state = ResultState.error;
      notifyListeners();
      _message = 'Error loading data: $e';
    }
  }
}
