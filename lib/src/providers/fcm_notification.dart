import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:transporte_app/src/utils/prefencia_util.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  Preferencias pref = new Preferencias();
  final _mensajesStreamController =
      StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get mensajes => _mensajesStreamController.stream;
  initNotificacions() async {
    _firebaseMessaging.requestNotificationPermissions();
    // _firebaseMessaging.getToken().then((token) {
    //   print('===>>> FCM $token');
    //   pref.tokenFCM = token;
    // });
    final token = await _firebaseMessaging.getToken();
    print('===>>> FCM $token');
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> info) async {
          print("onMessage: $info");
          pref.origenFCM = 0;
          _mensajesStreamController.sink.add(info);
        },
        onLaunch: (Map<String, dynamic> info) async {
          print("onLaunch: $info");
          pref.origenFCM = 1;
          _mensajesStreamController.sink.add(info);
        },
        onResume: (Map<String, dynamic> info) async {
          print("onResume: $info");
          pref.origenFCM = 2;
          _mensajesStreamController.sink.add(info);
        },
        onBackgroundMessage: null);
  }

  dispose() {
    _mensajesStreamController?.close();
  }
}
