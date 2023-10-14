// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/constant/applink.dart';

class OrdersData {
  Curd curd;
  OrdersData(this.curd);
  checkout(
    String userid,
    String address,
    String recivetype,
    String pricedelivery,
    String price,
    String couponid,
    String paymentmethod,
    String coupondiscount,
    String total,
  ) async {
    var response = await curd.postData(AppLink.checkout, {
      "userid": userid,
      "address": address,
      "recivetype": recivetype,
      "pricedelivery": pricedelivery,
      "price": price,
      "couponid": couponid,
      "paymentmethod": paymentmethod,
      "coupondiscount": coupondiscount,
      "total": total,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewOrders(String userid) async {
    var response = await curd.postData(AppLink.vieworders, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  delete(String orderid) async {
    var response =
        await curd.postData(AppLink.deleteorder, {"orderid": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
