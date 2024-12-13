import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/get_des_of_position.dart';
import 'package:latlong2/latlong.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.noAction;
  LocationMap locationMap = LocationMap();
  Position? position;
  LatLng? latLng = const LatLng(0, 0);
  List<Marker> markers = [];

  MapController? mapController;
  TextEditingController? controllerSearch;
  addMarker(point) {
    markers.clear();
    markers.add(Marker(
        point: point,
        width: 80,
        height: 80,
        child: const Icon(
          Icons.location_on,
          size: 40,
          color: AppColor.primaryColor,
        )));
    update();
  }

  getPosition() async {
    await locationMap.check(statusRequest);
    statusRequest = StatusRequest.noAction;
    update();
    mapController = MapController();
    controllerSearch = TextEditingController();
    position = await Geolocator.getCurrentPosition();
    latLng = LatLng(position!.latitude, position!.longitude);
    mapController!.move(latLng!, 14.5);
    addMarker(latLng);
    statusRequest = StatusRequest.noAction;
    update();
  }

  getLatLngFromDescriptionkkk() async {
    if (GetPlatform.isMobile) {
      await locationMap.getLatLngFromDescription(
        latLng: latLng!,
        mapController: mapController,
        des: controllerSearch!.text,
      );
      update();
    }
  }

  continueFun() async {
    Placemark? placemark;
    if (GetPlatform.isMobile) {
      placemark = await locationMap.getDesOfPosition(markers[0].point);
    }
    if (markers.isNotEmpty) {
      Get.toNamed(AppRoute.addressparttwo,
          arguments: {"latLng": markers[0].point, "placemark": placemark});
      markers = [];
    } else {
      Get.defaultDialog(middleText: "Please Select Your Location On This Map");
    }
  }

  @override
  void onInit() async {
    await getPosition();
    super.onInit();
  }
}
