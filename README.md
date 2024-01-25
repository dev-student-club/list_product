# List Product

Starter Project For Student Club

## Table of Contents

- [About](#about)
- [Project Structure](#project-structure)
- [API Documentation](#api-documentation)
- [How to Run the Project](#how-to-run-the-project)

## About

This project aims to create a simple Flutter application for displaying a list of products and their details. The primary goals include showcasing the implementation of Flutter widgets, handling navigation, and for a starter fetching data from a local JSON file.

## Project Structure

Recommended project folder structure:

```
.
├── lib
│   ├── helpers
│   │   └── result_state.dart: Enum to represent the different states of an asynchronous operation
│   ├── detail
│   │   └── product_detail.dart: Displays the product detail page.
│   ├── home
│   │   └── list_product.dart: Displays the product list page.
│   ├── data
│   │   └── api
│   │   │   └── api_service.dart: setup API services.
│   │   │ 
│   │   └── product.dart: Model for representing product data.
│   ├── providers
│   │   └── get_detail_product_providers.dart: providers class for fetching API products.
│   │   │ 
│   │   └── get_products_providers.dart: providers class for fetching API detail products.
│   │
│   ├── main.dart: Main file for application routing.
├── android
├── ios
├── assets
│   └── app_demo.gif: for show demo app on readme.md file on github.
├── test
├── web
├── pubspec.yaml: Configuration file for managing packages.
```

## API Documentation

### Base URL
- Base URL: `https://dummyjson.com`

### 1. Get All Products
- Endpoint: `/products`
- Method: `GET`
- Description: Get all products available.
- Example: `https://dummyjson.com/products`

### 2. Get Single Product
- Endpoint: `/products/{id}`
- Method: `GET`
- Description: Get details of a specific product.
- Parameters:
  - `{id}`: The unique identifier for the product.
- Example: `https://dummyjson.com/products/1`

### 3. Search Products
- Endpoint: `/products/search`
- Method: `GET`
- Description: Search for products based on a query string.
- Parameters:
  - `q`: The search query.
- Example: `https://dummyjson.com/products/search?q=Laptop`

### Response Format
- The response for all endpoints will be in JSON format.

### Example Response for Get All Products:
```json
{
  "products": [
    // ... (list of products)
  ],
  "total": 100,
  "skip": 0,
  "limit": 30
}
```

### Example Response for Get Single Product:
```json
{
  "id": 1,
  "title": "iPhone 9",
  "description": "An apple mobile which is nothing like apple",
  "price": 549,
  "discountPercentage": 12.96,
  "rating": 4.69,
  "stock": 94,
  "brand": "Apple",
  "category": "smartphones",
  "thumbnail": "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg",
  "images": [
    // ... (list of image URLs)
  ]
}
```

### Example Response for Search Products:
```json
{
  "products": [
    // ... (list of products)
  ],
  "total": 3,
  "skip": 0,
  "limit": 3
}
```

### Notes
- All HTTP methods (GET) are supported.
- You can use either HTTP or HTTPS for your requests.

## How to Run the Project

Make sure you have Flutter and Dart installed on your machine.

1. Clone this repository:

    ```bash
    git clone https://github.com/dev-student-club/list_product.git
    ```

2. Open the terminal and navigate to the project directory:

    ```bash
    cd project-name
    ```
    
3. Run this command line:

    ```bash
    flutter pub get
    ```

4. Run the application:

    ```bash
    flutter run
    ```

5. The project will open on your emulator or physical device.

<p align="center">
  <img src="assets/app_demo.gif" alt="Demo Video" width="250" style="display: block; margin: 0 auto;"/>
</p>

