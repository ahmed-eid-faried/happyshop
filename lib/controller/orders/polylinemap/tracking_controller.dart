import 'dart:async';
import 'package:happyshop/controller/orders/polylinemap/drawpolylines.dart';
import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/function/get_des_of_position.dart';
import 'package:happyshop/data/model/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrackingController extends GetxController {
  late StreamSubscription<Position> positionSubscription;
  List<LatLng> routeCoordinates = [];
  late OrdersModel ordersModel;
  StatusRequest statusRequest = StatusRequest.noAction;
  LocationMap locationMap = LocationMap();
  LatLng? position = const LatLng(0, 0);
  LatLng? latLng = const LatLng(0, 0);
  List<Marker> markers = [];
  MapController? mapController;
  double zoom = 14.5;

  initialData() async {
    // statusRequest = StatusRequest.loading;
    // update();
    ordersModel = Get.arguments['ordersModel'];
    latLng = LatLng(
      double.parse(ordersModel.addressLat!),
      double.parse(ordersModel.addressLong!),
    );
    mapController = MapController();
    markers = [
      Marker(
        key: const Key("address"),
        point: latLng!,
        width: 80,
        height: 80,
        builder: (context) => const Icon(
          Icons.location_on,
          size: 40,
          color: AppColor.primaryColor,
        ),
      ),
    ];
    // await getPosition();
    mapController = MapController();
    await locationMap.check(statusRequest);
    if (ordersModel.ordersStatus == "3") {
      await getLocationDelivery();
      List<List<double>> coordinates = [
        [position!.latitude, position!.longitude],
        [latLng!.latitude, latLng!.longitude]
      ];

      //  [[8.681495, 49.41461],[8.687872, 49.420318]];
      await fetchRouteCoordinates(
          routeCoordinates, coordinates, position, latLng);
    }

    await moveMap();
    update();

    statusRequest = StatusRequest.success;
    update();
  }

  // getPosition() async {
  //   mapController = MapController();
  //   await locationMap.check(statusRequest);
  //   Position positionk = await Geolocator.getCurrentPosition();
  //   position = LatLng(positionk.latitude, positionk.longitude);
  //   moveMap();
  //   update();
  //   positionSubscription = Geolocator.getPositionStream().listen((event) {
  //     position = LatLng(event.latitude, event.longitude);
  //     moveMap();
  //     update();
  //   });
  // }

  moveMap() {
    markers.removeWhere((element) => element.key == const Key("mylocation"));
    markers.add(
      Marker(
        key: const Key("mylocation"),
        point: position!,
        width: 80,
        height: 80,
        builder: (context) => const Icon(
          Icons.location_on,
          size: 40,
          color: AppColor.fourthColor,
        ),
      ),
    );
    mapController!.move(latLng!, zoom);
    statusRequest = StatusRequest.noAction;
    update();
  }

  getPositionOfOrder() async {
    await locationMap.check(statusRequest);
    latLng = LatLng(
      double.parse(ordersModel.addressLat!),
      double.parse(ordersModel.addressLong!),
    );
    mapController!.move(latLng!, zoom);
    statusRequest = StatusRequest.noAction;
    update();
  }

  getLocationDelivery() {
    // Timer  timer = Timer.periodic(const Duration(seconds: 5), (timer) {       }
    FirebaseFirestore.instance
        .collection('delivery')
        .doc(ordersModel.ordersId)
        .snapshots()
        .listen((event) {
      if (event.exists) {
        position = LatLng(event.get('lat'), event.get('long'));
        update();
      }
    });
  }

  void increaseZoom() {
    zoom += 0.1;
    update();
  }

  void decreaseZoom() {
    zoom -= 0.1;
    update();
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
