// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/constant/applink.dart';

class OrderDetailsData {
  Curd curd;
  OrderDetailsData(this.curd);
  getData(String orderId) async {
    var response =
        await curd.postData(AppLink.ordersdetails, {"orderid": orderId});
    return response.fold((l) => l, (r) => r);
  }
}
