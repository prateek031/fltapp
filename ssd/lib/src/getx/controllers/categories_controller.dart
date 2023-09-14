// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:ssd/services/api/categories_services.dart';

import '../../model/categories model.dart';


class CategoryController extends GetxController {
  final CategoriesService categoriesService = CategoriesService();
  RxList<Data> categories = <Data>[].obs;
  RxBool isLoading = true.obs; 

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isLoading.value = true;

      final response = await categoriesService.getCategories(
          'hWVqhMrErovDpNBxxab2yCb3hVf7N8QKN698GCujXs3tbdRfjB');

      final categoriesList = (response.data['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e))
          .toList();

      categories.value = categoriesList;
    } catch (e) {
      print('Error fetching categories: $e');
    } finally {
      isLoading.value = false; 
    }
  }
}