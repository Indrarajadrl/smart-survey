// // import 'dart:io';

// // Utils folder contains the helpers, services, UI utils, mixins which are used throughout the application
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkC extends GetxController {
  var statusConnection = ''.obs;

  final Connectivity _connectivity = Connectivity();
  // ignore: cancel_subscriptions
  StreamSubscription<ConnectivityResult>? connectivitySubscription;

  @override
  void onInit() {
    initConnectivity();
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    if (result != null) {
      return _updateConnectionStatus(result);
    }
  }

  _updateConnectionStatus(result) {
    switch (result) {
      case ConnectivityResult.wifi:
        statusConnection.value = 'ONLINE';
        break;
      case ConnectivityResult.mobile:
        statusConnection.value = 'ONLINE';
        break;
      case ConnectivityResult.none:
        statusConnection.value = 'OFFLINE';
        break;
      default:
        Get.snackbar("network Error", "failed to get network connection");
    }
  }
}
