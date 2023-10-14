import 'package:get_storage/get_storage.dart';
import 'package:happyshop/core/function/get_des_of_position.dart';
import 'package:happyshop/data/model/ordersitemsmodel.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/data/datasource/remote/order_details_data.dart';
import 'package:happyshop/data/model/orders.dart';

class OrderDetailsController extends GetxController {
  late OrdersModel ordersModel;
  StatusRequest statusRequest = StatusRequest.success;
  String ordersAddress = "";
  String ordersRecivetype = "";
  String addressCity = "";
  String addressStreet = "";
  String ordersId = "";
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  List<OrdersItemsModel> itemsData = [];
  LocationMap locationMap = LocationMap();
  Position? position;
  LatLng? latLngYourLocation = const LatLng(0, 0);
  LatLng? latLng = const LatLng(0, 0);

  bool loading = true;
  double get ordersPrice => double.parse(ordersModel.ordersPrice!);
  double get ordersPricedelivery =>
      double.parse(ordersModel.ordersPricedelivery!);
  double get ordersTotalprice => double.parse(ordersModel.ordersTotalprice!);
  double get coupon => (ordersPrice + ordersPricedelivery) - ordersTotalprice;
  List<Marker> markers = [];
  MapController? mapController;
  final box = GetStorage();

  // getPosition() async {
  //   await locationMap.check(statusRequest);
  //   position = await Geolocator.getCurrentPosition();
  //   latLngYourLocation = LatLng(position!.latitude, position!.longitude);
  //   // update();
  //   mapController!.move(latLngYourLocation!, 14.5);
  //   update();
  // }

  getPositionOfOrder() async {
    await locationMap.check(statusRequest);
    latLng = LatLng(
      double.parse(ordersModel.addressLat!),
      double.parse(ordersModel.addressLong!),
    );
    mapController!.move(latLng!, 14.5);
    statusRequest = StatusRequest.noAction;
    update();
  }

  initialData() async {
    ordersModel = Get.arguments['ordersModel'];
    ordersAddress = ordersModel.ordersAddress!;
    addressCity = ordersModel.addressCity!;
    addressStreet = ordersModel.addressStreet!;
    ordersRecivetype = ordersModel.ordersRecivetype!;
    ordersId = ordersModel.ordersId!;
    latLng = LatLng(
      double.parse(ordersModel.addressLat!),
      double.parse(ordersModel.addressLong!),
    );
    mapController = MapController();

    // await getPosition();
    await getPositionOfOrder();
    await getData();
    statusRequest = StatusRequest.success;
    update();
  }

  getData() async {
    var response = await orderDetailsData.getData(ordersId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = await response['data'];
        itemsData =
            responseData.map((e) => OrdersItemsModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    loading = false;
    update();
  }

  @override
  void onInit() async {
    await initialData();
    super.onInit();
  }
}
