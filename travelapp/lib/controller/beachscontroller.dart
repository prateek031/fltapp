
import 'package:get/get.dart';
import 'package:travelapp/models/beachesmodel.dart';
import 'package:travelapp/services/deachesremoteservices.dart';
import 'package:travelapp/views/utils/toastmsg.dart';

class BeachesControllar extends GetxController {
  RxList<BeachesModel> beachesList = <BeachesModel>[].obs;
  RxBool isLoading=false.obs;

  @override
  void onInit() {
    fetchLoaction();
    super.onInit();
  }

  void fetchLoaction() async {
    
    List<BeachesModel>? beaches = await BeachesRemoteServices.fetchLoaction();
    print('888888888888 => ${beaches?.length}');

    try {
      isLoading(true);
      if (beaches != null) {
        beachesList.addAll(beaches);
      }
    } catch (e) {
      ToastMsg().tostMessage(e.toString());
      Get.snackbar("error", e.toString());
    }finally{
      isLoading(false);
    }
  }
}
