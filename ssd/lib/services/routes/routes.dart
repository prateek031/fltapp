// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:ssd/src/getx/bindings/form_binding.dart';
import 'package:ssd/src/view/cart_page.dart';
import 'package:ssd/src/view/categories_page.dart';
import 'package:ssd/src/view/home_page.dart';
import 'package:ssd/src/view/login_page.dart';
import 'package:ssd/src/view/product_detail_page.dart';
import 'package:ssd/src/view/search_products_page.dart';
import 'package:ssd/src/view/specific_category_page.dart';

import '../../src/view/featured_products_page.dart';

class Routes {
  
  static String HomePage = '/homepage';
  static String LogInPage = '/loginpage';
  static String CategoriesPage = '/categoriespage';
  static String SearchProductsPage = '/searchproductspage';
  static String FeaturedProductsPage = '/featuredproductspage';
  static String CartPage = '/cartpage';
  static String ProductDetailsPage = '/ProductDetailspage';
  static String SpecificCategoryPage = '/specificcategorypage';

}

final getPages = [
  
  GetPage(
    name: Routes.HomePage,
    page: () => HomePage(),
  ),
  GetPage(
      name: Routes.LogInPage, page: () => LoginPage(), binding: FormBinding()),
  GetPage(name: Routes.CategoriesPage, page: () => CategoriesPage()),
  GetPage(name: Routes.SearchProductsPage, page: () => SearchProductsPage()),
  GetPage(
      name: Routes.FeaturedProductsPage, page: () => FeaturedProductsPage()),
  GetPage(name: Routes.CartPage, page: () => CartPage()),
  GetPage(name: Routes.ProductDetailsPage, page: () => ProductDetailsPage()),
  GetPage(name: Routes.SpecificCategoryPage, page: () => SpecificCategoryPage()),

];
