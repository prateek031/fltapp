// ignore_for_file: unused_local_variable, avoid_print
import 'package:get/get.dart';
import 'package:ssd/src/model/product_model.dart';

import '../../../services/api/category_product_services.dart';

class CategoryProductController extends GetxController {
  final CategoryProductService _apiService = CategoryProductService();
  final categoryproducts = <Product>[].obs;
  final isLoading = true.obs;


  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts({int ?category}) async {
    try {
      print("phuu phuu phuu");
      isLoading.value = true;
      final response = await _apiService.findgroupProducts(category: category);
      if (response.statusCode == 200) {
        
        var respo = (response.data['data']["data"] as List<dynamic>).map((e) {
          print(Product.fromJson(e).id);

          return Product.fromJson(e);
        }).toList();
        categoryproducts.value = respo;
      } else {
      Get.snackbar("Error","Status Code${response.statusCode}");

      }
    } catch (e) {
    
      print('Error: $e');
      Get.snackbar("Error","This error is from category product Controller$e");
    } finally {
      isLoading.value = false;
    }

 
    
  }
   
}
