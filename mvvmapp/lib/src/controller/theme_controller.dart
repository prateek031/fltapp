import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TheamController extends GetxController {
  
  
  RxBool isDark = RxBool(false);
 setdata()async{
final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setBool('repeat', isDark.value);
  bool CheckValue = prefs.containsKey('repeat');
  print("is darkkkkkkk $CheckValue");
 }

  
}
