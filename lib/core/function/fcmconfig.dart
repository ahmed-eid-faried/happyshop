import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:happyshop/controller/orders/orders_view_controller.dart';
import 'package:happyshop/core/constant/routes.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

requestPermission() async {
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((event) {
    FlutterRingtonePlayer flutterRingtonePlayer = FlutterRingtonePlayer();
    flutterRingtonePlayer.playNotification();
    // FlutterRingtonePlayer.playNotification();
    Get.snackbar(event.notification!.title!, event.notification!.body!);
    refershPageNotifcation(event.data);
    print("notification");
    print('title: ${event.notification!.title!}');
    print('body: ${event.notification!.body!}');
  });
}

refershPageNotifcation(Map<String, dynamic> data) {
  print(data['pageid']);
  print(data['pagename']);
  OrdersViewController controller = Get.find();

  if (data['pagename'] == "refreshorderpending" &&
      Get.currentRoute == AppRoute.ordersView) {
    controller.getData();
  }
}
