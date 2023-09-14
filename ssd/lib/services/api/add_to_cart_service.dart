import 'package:dio/dio.dart';

class AddToCartService {
  final Dio _dio = Dio();

  static const String baseUrl = 'http://stagingapi.shreesaidarshan.com/api/';

  Future<Response> addToCart({
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

      final response = await _dio.post(
        'http://stagingapi.shreesaidarshan.com/api/customer/add-to-cart',
        data: FormData.fromMap({
          'inventory_id[]': inventoryId,
          'quantity[]': quantity,
          'quantity_count[]': quantityCount,
          'priceable_quantity[]': pricableQuantity,
          'price[]':price,
          'unit_price[]': unitPrice,
          'product_type[]': "PEACE",
          'product_type_id[]': "32",
          'unit_quantity[]': unitQuantity,
          'slab_id[]': 40944,
          'type[]': 'ONLINE',
        }),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response;
    } 
     catch (error) {

      throw Exception('Failed to add to cart: ${(error as DioException).response}');
    }
  }
}