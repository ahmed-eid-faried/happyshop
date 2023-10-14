// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/constant/applink.dart';

class CustomersServiceData {
  Curd curd;
  CustomersServiceData(this.curd);
  addMessage(String userid, String message) async {
    var response = await curd.postData(AppLink.customersservice, {
      "userid": userid,
      "message": message,
    });
    return response.fold((l) => l, (r) => r);
  }
}
