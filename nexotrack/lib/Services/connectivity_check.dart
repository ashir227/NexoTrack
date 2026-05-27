import 'package:connectivity_plus/connectivity_plus.dart';

loadlist() async {
  bool nointernet = false;
  bool isload = true;
  var isconnection = await Connectivity().checkConnectivity();
  if (isconnection == ConnectivityResult.none) {
    nointernet = true;
    isload = false;
    return;
  }
}
