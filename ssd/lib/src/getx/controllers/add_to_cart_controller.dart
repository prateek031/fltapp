      import 'package:get/get.dart';

import '../../../services/api/add_to_cart_service.dart';


class AddToCartCartController extends GetxController {
  final AddToCartService _apiService = AddToCartService();
  final RxBool isLoading = false.obs;

  Future<void> addToCart({
    required String token,
    required String inventoryId,
      required String quantity,
      required String quantityCount,
      required String pricableQuantity,
      required String price,
      required String unitPrice,
      required String unitQuantity,
  }) async {
    try {
      isLoading(true);
      final response = await _apiService.addToCart(token: token,inventoryId: inventoryId,quantity:quantity,quantityCount:quantityCount,pricableQuantity: pricableQuantity,
      price: price,unitPrice: unitPrice, unitQuantity: unitQuantity,  );
      print('API Response: ${response.data}');
    } catch (error) {
      print('API Error: $error');
    } finally {
      isLoading(false);
    }
  }
}