
import 'package:shared_preferences/shared_preferences.dart';

class UserVisited{
  userVisited() async {
    print("Helloooo Sir");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('UserVisited', true);
  bool CheckValue = prefs.containsKey('UserVisited');
  print("dhchdhdchvdschvd $CheckValue");
  
}
 
}