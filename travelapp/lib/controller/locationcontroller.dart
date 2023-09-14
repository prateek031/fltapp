import 'package:get/get.dart';
import 'package:travelapp/models/locationmodel.dart';
import 'package:travelapp/services/remoteservices.dart';
import 'package:travelapp/views/utils/toastmsg.dart';

class LoacationControllar extends GetxController {
  RxList<LocationModel> locationtList = <LocationModel>[].obs;
  RxBool isLoading=false.obs;

  @override
  void onInit() {
    fetchLoaction();
    super.onInit();
  }
  void fetchLoaction() async {
    List<LocationModel>? locations = await RemoteServices.fetchLoaction();
     isLoading(true);
    print('9999999999 => ${locations?.length}');
    try {
      isLoading(true);
      if (locations != null) {
      locationtList.addAll(locations);
    }
    } catch (e) {
      ToastMsg().tostMessage(e.toString());
    }
    finally{
      isLoading(false);
    }
  }
}
