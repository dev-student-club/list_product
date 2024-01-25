import 'package:flutter/material.dart';
import 'package:list_product_json/data/api/api_service.dart';
import 'package:list_product_json/data/product.dart';
import 'package:list_product_json/helpers/result_state.dart';

class GetProductsProvider extends ChangeNotifier {
  final ApiService apiService;
  late BaseProductResponse _productsResult;
  ResultState _state = ResultState.loading;
  String _message = '';

  // Getters for external access
  String get message => _message;
  BaseProductResponse get result => _productsResult;
  ResultState get state => _state;

  // Constructor to initialize the provider with the API service
  GetProductsProvider({required this.apiService}) {
    // Initiate the fetch of all products when the provider is created
    _fetchAllProducts();
  }

  // Private method to fetch all products from the API
  Future<void> _fetchAllProducts() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      // Request the list of products from the API service
      final result = await apiService.getProduct();

      // Check if valid product data is received
      if (result.products != null && result.products!.isNotEmpty) {
        // Update the state and result with the received products
        _state = ResultState.hasData;
        notifyListeners();
        _productsResult = result;
      } else {
        // Update the state and message when no valid results are found
        _state = ResultState.noData;
        notifyListeners();
        _message = 'No results found';
      }
    } catch (e) {
      // Handle errors during the API request and update the state and message
      _state = ResultState.error;
      notifyListeners();
      _message = 'Error loading data: $e';
    }
  }
}
