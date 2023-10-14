import 'package:happyshop/controller/cart/cart_controller_imp.dart';
import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/itemsdetails.dart';
import 'package:happyshop/data/model/coupon.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  intialData();
  delete(String itemsid);
  deleteitem();
  add(String itemsid);
  additem();
  getcountofitems();
  getdata(String itemsid);
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  ItemDetialsData itemDetialsData = ItemDetialsData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  String itemsid = "";
  String userid = "";
  MyService myServices = Get.find();
  List myCartViewList = [];
  int? count = 0;
  double? price = 0;
  double? shipping = 0;
  double? couponVal = 0;
  CouponModel? couponModel;
  String? couponId = "0";
  String? couponDiscount = "0";
  CartControllerImp cartControllerImp = CartControllerImp();
  late ItemsModel itemsModel;
  String itemspricediscount = "";
  int? value = 0;
  String totalrating = "0";
  String heroTag = '';
  List subPropt = [
    {"name": "red", "active": "1"},
    {"name": "blue", "active": "0"},
    {"name": "white", "active": "1"},
    {"name": "yellow", "active": "0"},
    {"name": "orange", "active": "0"},
    {"name": "pink", "active": "1"},
  ];

  @override
  intialData() async {
    heroTag = '';
    itemsModel = Get.arguments['itemsModel'];
    heroTag = Get.arguments['herotag'];
    itemspricediscount = itemsModel.itemspricediscount!;
    totalrating = itemsModel.totalrating!;

    update();
    await getcountofitems();
  }

  @override
  add(String itemsid) async {
    userid = myServices.pref.getString("id")!;
    // statusRequest = StatusRequest.loading;
    // update();
    var response = await itemDetialsData.addCart(userid, itemsid);
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
  additem() async {
    value = value! + 1;
    update();
    add(itemsModel.itemsId!);
  }

  @override
  delete(itemsid) async {
    int? value = await getdata(itemsid);
    if (value! > 0) {
      userid = myServices.pref.getString("id")!;
      // statusRequest = StatusRequest.loading;
      // update();
      var response = await itemDetialsData.deleteCart(userid, itemsid);
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
  deleteitem() async {
    value! > 0 ? {value = value! - 1, delete(itemsModel.itemsId!)} : null;
    update();
  }

  @override
  Future<int?> getdata(itemsid) async {
    userid = myServices.pref.getString("id")!;
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemDetialsData.getcountofitemsCart(userid, itemsid);
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

  @override
  getcountofitems() async {
    value = await getdata(itemsModel.itemsId!);
    update();
  }

  ratingItems(String itemid, double rating, String comment) async {
    userid = myServices.pref.getString("id")!;
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemDetialsData.rating(
        userid, itemid, rating.toString(), comment);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.itemsdetails,
            arguments: {"itemsModel": itemsModel});
        // getData();
        // update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  // @override
  // void refresh() {
  //   getcountofitems();
  //   super.refresh();
  // }
}
