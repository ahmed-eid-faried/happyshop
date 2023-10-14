import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/address.dart';
import 'package:happyshop/data/datasource/remote/orders.dart';
import 'package:happyshop/data/model/address_data_model.dart';
import 'package:happyshop/data/model/mycartmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  OrdersData ordersData = OrdersData(Get.find());

  late StatusRequest statusRequest;
  String? userid;
  MyService myServices = Get.find();
  List<AddressDataModel> data = [];
  List<MyCartViewModel> myCartViewList = [];
  String deliverySelector = "";
  String paymentsSelector = "";
  String addressIdSelector = "";
  late String pricedelivery;
  late String price;
  late String couponid;
  late String coupondiscount;
  double? total = 0;
  double? shipping = 0;
  double? couponVal = 0;
  select(AddressDataModel addressDataModel) {
    addressIdSelector = addressDataModel.addressId!;
    update();
  }

  bool isActive(AddressDataModel addressDataModel) {
    bool isActive = addressIdSelector == addressDataModel.addressId;
    return isActive;
  }

  getData() async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewAddress(userid!);
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      print(statusRequest);
      if (response['status'] == "success") {
        List responseData = response['data'];
        data = responseData.map((e) => AddressDataModel.fromJson(e)).toList();
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    if (paymentsSelector == "") {
      return Get.snackbar("Alarm", "please Add Payments Method",
          backgroundColor: AppColor.primaryColor.withOpacity(0.2));
    } else if (deliverySelector == "") {
      return Get.snackbar("Alarm", "please Add Recive Type",
          backgroundColor: AppColor.primaryColor.withOpacity(0.2));
    } else if (deliverySelector == "0" && addressIdSelector == "") {
      return Get.snackbar("Alarm", "please Add Your Address",
          backgroundColor: AppColor.primaryColor.withOpacity(0.2));
    } else {
      if (paymentsSelector == "1") {
        Get.offAllNamed(AppRoute.paymentpage, arguments: {
          "pricedelivery": pricedelivery,
          "price": price,
          "couponid": couponid,
          "coupondiscount": coupondiscount,
          "userid": userid,
          "addressIdSelector": addressIdSelector,
          "deliverySelector": deliverySelector,
          "paymentsSelector": paymentsSelector,
          "myCartViewList": myCartViewList,
          "couponVal": couponVal,
          "total": total,
        });
      } else {
        checkoutRequestData();
      }
    }
  }

  checkoutRequestData() async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.checkout(
      userid!,
      addressIdSelector,
      deliverySelector,
      pricedelivery,
      price,
      couponid,
      paymentsSelector,
      coupondiscount,
      total.toString(),
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.home);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refersh() {
    data = [];
    deliverySelector = "";
    paymentsSelector = "";
    addressIdSelector = "";
    pricedelivery = "";
    price = "";
    couponid = "";
    coupondiscount = "";
  }

  intialData() async {
    pricedelivery = Get.arguments['pricedelivery'];
    price = Get.arguments['price'];
    couponid = Get.arguments['couponid'];
    coupondiscount = Get.arguments['coupondiscount'];
    myCartViewList = Get.arguments['myCartViewList'];

    shipping = Get.arguments['shipping'];
    couponVal = Get.arguments['couponVal'];
    total = Get.arguments['total'];

    await getData();
    AddressDataModel addressDataModel = data[0];
    select(addressDataModel);
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
