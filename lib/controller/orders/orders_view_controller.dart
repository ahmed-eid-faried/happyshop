import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/fonts.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/orders.dart';
import 'package:happyshop/data/model/orders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OrdersViewController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  late StatusRequest statusRequest;
  String? userid;
  MyService myServices = Get.find();
  List<OrdersModel> data = [];
  final box = GetStorage();

  getData() async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.viewOrders(userid!);
    statusRequest = handlingData(response);
    if (statusRequest != StatusRequest.offlinefailure) {
      if (statusRequest == StatusRequest.success) {
        print(statusRequest);
        if (response['status'] == "success") {
          List responseData = response['data'];
          data = responseData.map((e) => OrdersModel.fromJson(e)).toList();
          box.write('OrdersView', response);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      response = await box.read('OrdersView');
      if (response != null) {
        List responseData = response['data'];
        data = responseData.map((e) => OrdersModel.fromJson(e)).toList();
        statusRequest = StatusRequest.offlineViewData;
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

  deleteDialog(orderid) {
    Get.defaultDialog(
      title: "Alarm",
      middleText: "Do you want to delete the order?",
      titleStyle: AppFonts.textStyle,
      onConfirm: () {
        delete(orderid);
        update();
      },
      onCancel: () => Get.back(),
    );
  }

  delete(orderid) async {
    var response = await ordersData.delete(orderid!);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
      } else {
        // Get.defaultDialog(middleText: "Please request an order first");
        Get.defaultDialog(middleText: "Please  try again");
      }
    }
    data.removeWhere((element) => element.ordersId == orderid);
    update();
  }

  @override
  void onInit() async {
    getData();
    super.onInit();
  }

  goToDetails(OrdersModel ordersModel) async {
    Get.toNamed(AppRoute.orderdetails, arguments: {"ordersModel": ordersModel});
  }
}
