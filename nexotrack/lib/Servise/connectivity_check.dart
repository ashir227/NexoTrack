import 'package:connectivity_plus/connectivity_plus.dart';

_loadlist() async {
  var isconnection = await Connectivity().checkConnectivity();
}
