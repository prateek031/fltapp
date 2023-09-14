
import 'package:get/get.dart';
import 'package:travelapp/models/mountainmodel.dart';
import 'package:travelapp/services/mountainremoteservices.dart';
import 'package:travelapp/views/utils/toastmsg.dart';

class MountainControllar extends GetxController {
  RxList<MountainModel> mountainList = <MountainModel>[].obs;
  RxBool isLoading=false.obs;

  @override
  void onInit() {
    fetchLoaction();
    super.onInit();
  }

  void fetchLoaction() async {
    List<MountainModel>? mountain = await MountainRemoteServices.fetchLoaction();
    print('77777777777 => ${mountain?.length}');

    try {
      isLoading(true);
      if (mountain != null) {
        mountainList.addAll(mountain);
      }
    } catch (e) {
      print(e);
      ToastMsg().tostMessage(e.toString());
    }
    finally{
      isLoading(false);
    }
  }
}
