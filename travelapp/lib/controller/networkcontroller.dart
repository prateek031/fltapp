// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:travelapp/views/utils/toastmsg.dart';

class NetworkController extends GetxController {
  var connectiontype = false.obs;
  final Connectivity _connectivity = Connectivity();
   late StreamSubscription streamSubscription;
  @override
  void onInit() {
    super.onInit();
    getconnectionstatus();
    streamSubscription =
        _connectivity.onConnectivityChanged.listen(getconnectiontype);
  }

  getconnectionstatus() async {
    var connectivityresult;
    try {
      connectivityresult = await _connectivity.checkConnectivity();
    } catch (e) {
      ToastMsg().tostMessage(e.toString());
    }
  }

  getconnectiontype(connectivityresult) {
    if (connectivityresult == ConnectivityResult.wifi) {
      connectiontype.value = true;
    } else if (connectivityresult == ConnectivityResult.mobile) {
      connectiontype.value = true;
    } else {
      connectiontype.value = false;
    }
  }
}
