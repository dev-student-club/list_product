```markdown
# Project Name

Brief description of your project.

## Table of Contents

- [About](#about)
- [Project Structure](#project-structure)
- [How to Run the Project](#how-to-run-the-project)

## About

This project aims to create a simple Flutter application for displaying a list of products and their details. The primary goals include showcasing the implementation of Flutter widgets, handling navigation, and for a starter fetching data from a local JSON file.

## Project Structure

Recommended project folder structure:

```

```
.
├── lib
│   ├── detail
│   │   └── product_detail.dart: Displays the product detail page.
│   ├── home
│   │   └── list_product.dart: Displays the product list page.
│   ├── model
│   │   └── product.dart: Model for representing product data.
│   │
│   ├── main.dart: Main file for application routing.
├── android
├── ios
├── assets
│   └── local_data.json: JSON file as a source of local data.
├── test
├── web
├── pubspec.yaml: Configuration file for managing packages.
```

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

3. Run the application:

    ```bash
    flutter run
    ```

4. The project will open on your emulator or physical device.

