import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/orders.dart';
import 'package:happyshop/data/model/address_data_model.dart';
import 'package:happyshop/data/model/mycartmodel.dart';
import 'package:get/get.dart';

class PaymentPageController extends GetxController {
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
  late int price;
  late String couponid;
  late String coupondiscount;

  double? total = 0;
  double? shipping = 0;
  double? couponVal = 0;

  checkoutRequestData() async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.checkout(
      userid!,
      addressIdSelector,
      deliverySelector,
      pricedelivery,
      price.toString(),
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

  @override
  void onInit() {
    pricedelivery = Get.arguments['pricedelivery'];
    price = double.parse(Get.arguments['price']).ceil().toInt();
    couponid = Get.arguments['couponid'];
    coupondiscount = Get.arguments['coupondiscount'];
    userid = Get.arguments['userid'];
    addressIdSelector = Get.arguments['addressIdSelector'];
    deliverySelector = Get.arguments['deliverySelector'];
    paymentsSelector = Get.arguments['paymentsSelector'];
    myCartViewList = Get.arguments['myCartViewList'];

    shipping = Get.arguments['shipping'];
    couponVal = Get.arguments['couponVal'];
    total = Get.arguments['total'];

    super.onInit();
  }
}
