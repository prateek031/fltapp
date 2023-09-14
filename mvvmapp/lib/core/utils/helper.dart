
import 'package:fluttertoast/fluttertoast.dart';

class Helper {

    tostMessage(String messege){
    Fluttertoast.showToast(
        msg: messege,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        fontSize: 16.0,
    );
  }
  
}