// ignore_for_file: unused_local_variable
import 'package:get/get.dart';
import 'package:ssd/src/model/product_model.dart';
import '../../../services/api/view_all_product.dart';

class ProductController extends GetxController {
  final ApiService _apiService = ApiService();
  final products = <Product>[].obs;
  final isLoading = true.obs;
  int currentPage = 1;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      print("This log is from view all product controller");
      isLoading.value = true;
      final response = await _apiService.findProducts(page:currentPage);
      if (response.statusCode == 200) {
        
        var resp = (response.data['data']["data"] as List<dynamic>).map((e) {
          // print(Product.fromJson(e).id);
          return Product.fromJson(e);
        }).toList();
        products.value = resp;
      } else {
      Get.snackbar("Error","Status Code${response.statusCode}");

      }
    } catch (e) {
    
      print('Error: $e');
      Get.snackbar("Error","This error is from View all Product Controller$e");
    } finally {
      isLoading.value = false;
    }

 
    
  }
   void loadNextPage() {
  currentPage++;
  fetchProducts();
}
}
