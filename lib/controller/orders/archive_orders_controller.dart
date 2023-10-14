import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/archive.dart';
import 'package:happyshop/data/model/orders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ArchiveOrdersViewController extends GetxController {
  ArchiveOrdersData archiveOrdersData = ArchiveOrdersData(Get.find());

  late StatusRequest statusRequest;
  String? userid;
  MyService myServices = Get.find();
  List<OrdersModel> data = [];
  final box = GetStorage();

  getData() async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveOrdersData.viewOrders(userid!);
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest != StatusRequest.offlinefailure) {
      if (statusRequest == StatusRequest.success) {
        print(statusRequest);
        if (response['status'] == "success") {
          List responseData = response['data'];
          data = responseData.map((e) => OrdersModel.fromJson(e)).toList();
          box.write('ArchiveOrdersView', response);
          print(data);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      response = await box.read('ArchiveOrdersView');
      if (response != null) {
        List responseData = response['data'];
        data = responseData.map((e) => OrdersModel.fromJson(e)).toList();
        statusRequest = StatusRequest.offlineViewData;
      }
    }
    update();
  }

  ratingOrder(String ordersid, double rating, String comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await archiveOrdersData.rating(ordersid, rating.toString(), comment);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.orderarchive);
        // getData();
        // update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getValOfReciveType(String val) {
    return val == "0" ? "Delivery" : "Receipt From The Store";
  }

  getValOfPaymentMethod(String val) {
    return val == "0" ? "Cash" : "Payment Method";
  }

  getValOfOrderStatus(String val) {
    switch (val) {
      case "0":
        return "Pending Approval";
      case "1":
        return "The order is being prepared";
      case "2":
        return "Ready to picked up by delivery man";
      case "3":
        return "on the man";
      default:
        return "Archive";
    }
  }

  @override
  void onInit() async {
    getData();
    super.onInit();
  }
}
