// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/cart.dart';
import 'package:happyshop/data/model/coupon.dart';
import 'package:happyshop/data/model/mycartmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  add(String itemsid);
  delete(String itemsid);
  view();
  getcountofitems(String itemsid);
  deleteitem(itemsId);
  additem(itemsId);
  coupon();
  goToCheckout();
}

class CartControllerImp extends CartController {
  int? value = 0;
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  late String? itemsid;
  late String? userid;
  MyService myServices = Get.find();
  List<MyCartViewModel> myCartViewList = [];
  int? count = 0;
  double? price = 0;
  double? shipping = 0;
  double? couponVal = 0;
  CouponModel? couponModel;
  String? couponId = "0";
  String? couponDiscount = "0";

  double? get total => price! + shipping! - ((couponVal! * price!) / 100);
  TextEditingController? controllercouponname;

  @override
  add(String itemsid) async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(userid, itemsid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // Get.snackbar("", "تم الاضافة للسلة");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  delete(itemsid) async {
    int? value = await getcountofitems(itemsid);
    if (value! > 0) {
      userid = myServices.pref.getString("id");
      statusRequest = StatusRequest.loading;
      update();
      var response = await cartData.deleteCart(userid, itemsid);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          // Get.snackbar("", "تم الحذف من السلة");
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  Future<int?> getcountofitems(itemsid) async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getcountofitemsCart(userid, itemsid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        var countitems = int.parse(response['data'][0]['countitems']);
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
        return 0;
      }
    }
    update();
    return 0;
  }

  refreshFun() {
    count = 0;
    price = 0;
    shipping = 0;
    couponVal = 0;
    myCartViewList.clear();
    update();
  }

  @override
  view() async {
    refreshFun();
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getData(userid);
    statusRequest = await handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        count = int.parse(response['countprice'][0]['totalcount']);
        price = double.parse(response['countprice'][0]['totalprice']);
        myCartViewList =
            responseData.map((e) => MyCartViewModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  additem(itemsId) async {
    await add(itemsId!);

    view();
    update();
  }

  @override
  deleteitem(itemsId) async {
    await delete(itemsId!);
    view();
    update();
  }

  @override
  coupon() async {
    var response = await cartData.coupon(controllercouponname!.text);
    if (response['status'] == "success") {
      // var responseData = response['data']['coupon_discount'];
      // couponVal = double.parse(responseData);
      // print(couponVal);
      var responseData = response['data'];
      couponModel = CouponModel.fromJson(responseData);
      couponVal = double.parse(couponModel!.couponDiscount!);
      couponId = couponModel!.couponId.toString();
      couponDiscount = couponModel!.couponDiscount.toString();
    }
    if (response['status'] == "failure") {
      couponVal = 0;
    }
    update();
  }

  @override
  goToCheckout() {
    // if (myCartViewList == []) {
    //   return Get.snackbar("Alarm", "please Add Items For Cart",
    //       backgroundColor: AppColor.primaryColor.withOpacity(0.2));
    // } else {
    print("goToCheckout");
    Get.toNamed(AppRoute.checkout, arguments: {
      "pricedelivery": shipping.toString(),
      "price": price.toString(),
      "couponid": couponId,
      "coupondiscount": couponDiscount,
      "myCartViewList": myCartViewList,
      "couponVal": couponVal,
      "total": total,
    });
    // }
  }

  @override
  void onInit() {
    view();
    controllercouponname = TextEditingController();
    couponVal = 0;
    super.onInit();
  }
}
