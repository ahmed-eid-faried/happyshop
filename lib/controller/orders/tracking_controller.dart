import 'dart:async';
import 'package:happyshop/core/function/get_des_of_position.dart';
import 'package:happyshop/core/function/polylinemap/routingmap.dart';
import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/color.dart';
 import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/model/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:routing_client_dart/routing_client_dart.dart';

class TrackingController extends GetxController {
  initialData() {}
  // getPositionOfDelivery() {}
  refreshLocation() {}
  moveMap() {}
  getPositionOfOrder() {}
  // doneOrders() {}
  callPhone() {}
  increaseZoom() {}
  decreaseZoom() {}
}

class TrackingControllerImp extends TrackingController {
  late StreamSubscription<Position> positionSubscription;
  List<LatLng> routeCoordinates = [];
  late OrdersModel ordersModel;
  StatusRequest statusRequest = StatusRequest.noAction;
  LocationMap locationMap = LocationMap();
  String deliverylatitude = '0';
  String deliverylongitude = '0';
  LatLng deliveryposition = const LatLng(0, 0);
  LatLng latLng = const LatLng(0, 0);
  LatLng deliverypositionStart = const LatLng(0, 0);
  List<Marker> markers = [];
  MapController? mapController;
  MyService myServices = Get.find();
  late String? deliveryid;
  late Timer timer;
  List<RoadLeg> roadDetailInfo = [];
  Duration duration = const Duration(seconds: 0);
  int distance = 0;
  List<RoadInstruction> instructions = [];
  double zoom = 14.5;
  // await getPositionOfDelivery();

  @override
  initialData() async {
    deliveryid = myServices.pref.getString("id");
    ordersModel = Get.arguments['ordersModel'];
    mapController = MapController();
    await locationMap.check(statusRequest);
    latLng = LatLng(double.parse(ordersModel.addressLat!),
        double.parse(ordersModel.addressLong!));
    deliverypositionStart = LatLng(
        double.parse(ordersModel.ordersDeliveryaddresslat!),
        double.parse(ordersModel.ordersDeliveryaddresslong!));
    RoutingMap routingMap = RoutingMap();
    await routingMap.routing(routeCoordinates, deliverypositionStart, latLng);
    markers = [
      Marker(
        key: const Key("address"),
        point: latLng,
        width: 80,
        height: 80,
        builder: (context) => const Icon(
          Icons.location_on,
          size: 40,
          color: AppColor.primaryColor,
        ),
      ),
      Marker(
        key: const Key("deliverypositionStart"),
        point: deliverypositionStart,
        width: 80,
        height: 80,
        builder: (context) => const Icon(
          Icons.location_on,
          size: 40,
          color: AppColor.primaryColor,
        ),
      ),
    ];
    roadDetailInfo = RoutingMap.roadDetailInfo;
    duration = Duration(seconds: RoutingMap.duration.toInt());
    distance = RoutingMap.distance.ceil();
    instructions = RoutingMap.instructions;
    await refreshLocation();
    statusRequest = StatusRequest.noAction;
    update();
  }

  // @override
  // getPositionOfDelivery() async {
  //   mapController = MapController();
  //   await locationMap.check(statusRequest);
  //   // await refreshLocation();

  //   update();
  // }

  @override
  refreshLocation() async {
    try {
      FirebaseFirestore.instance
          .collection("delivery")
          .doc(ordersModel.ordersId)
          .snapshots()
          .listen((event) {
        if (event.exists) {
          deliverylatitude = event.get('lat');
          deliverylongitude = event.get('long');
          deliveryposition = LatLng(
              double.parse(deliverylatitude), double.parse(deliverylongitude));
          moveMap();
          print('''FirebaseFirestore:- doc:-${(ordersModel.ordersId)}
           "lat": ${event.get('lat')},
          "long":${event.get('long')},''');
        }
      });
    } catch (e) {
      print('errorsFirebaseFirestore:- $e');
    }
  }

  @override
  moveMap() {
    markers.removeWhere((element) => element.key == const Key("mylocation"));
    markers.add(
      Marker(
        key: const Key("deliveryposition"),
        point: deliveryposition,
        width: 80,
        height: 80,
        builder: (context) => const Icon(
          Icons.local_taxi,
          size: 50,
          color: Colors.red,
        ),
      ),
    );
    mapController!.move(deliveryposition, zoom);
    statusRequest = StatusRequest.noAction;
    update();
  }

  @override
  getPositionOfOrder() async {
    await locationMap.check(statusRequest);
    latLng = LatLng(
      double.parse(ordersModel.addressLat!),
      double.parse(ordersModel.addressLong!),
    );
    mapController!.move(latLng, zoom);
    statusRequest = StatusRequest.noAction;
    update();
  }

  @override
  callPhone() async {
    final Uri telUri = Uri(scheme: 'tel', path: ordersModel.deliveryPhone);
    await launchUrl(telUri);
    update();
  }

  @override
  increaseZoom() {
    zoom += 0.2;
    update();
  }

  @override
  decreaseZoom() {
    zoom -= 0.2;
    update();
  }

  distanceForm(double distance, {bool distanceMeter = true}) {
    int distanceKm;
    int distanceM;
    if (distanceMeter == true) {
      distanceKm = (distance / 1000).floor();
      distanceM = (distance % 1000).round();
    } else {
      distanceKm = (distance).floor();
      distanceM = ((distance % 1) * 1000).round();
    }

    String distanceString =
        '${distanceKm == 0 ? '' : '$distanceKm Km'} ${distanceKm == 0 || distanceM == 0 ? '' : ':'} ${distanceM == 0 ? '' : '$distanceM m'}';
    return distanceString;
  }

  durationFoem(double durationBySecond) {
    var duration = Duration(seconds: durationBySecond.toInt());
    String hours = duration.inHours == 0 ? '' : '${duration.inHours} h : ';
    String min =
        duration.inMinutes % 24 == 0 ? '' : '${duration.inMinutes % 24}  m : ';
    String sec =
        duration.inSeconds % 60 == 0 ? '' : '${duration.inSeconds % 60}  s';
    return '$hours$min$sec';
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void onClose() {
    positionSubscription.cancel();
    super.onClose();
  }
}
