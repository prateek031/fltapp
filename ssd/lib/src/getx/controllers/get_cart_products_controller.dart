import 'package:get/get.dart';
import 'package:ssd/services/api/get_cart_products.dart';
import 'package:ssd/src/model/categories%20model.dart';
import 'package:ssd/src/model/get_cart_model.dart';

class GetCartController extends GetxController {
  GetCartService _apiService = GetCartService();
  final products = <CartProduct>[].obs;

  
    @override
  void onInit() {
    super.onInit();
    getcart();
    
  }

  Future<void> getcart() async {
    try {
      final response = await _apiService.getCart();
      if (response.statusCode == 200) {
        var resp =(response.data['data']["data"] as List<dynamic>).map((e) {
          print(CartProduct.fromJson(e).id);
          return CartProduct.fromJson(e);
        }).toList();
        //  var resp =response.data['data']["data"][1];

      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }
}