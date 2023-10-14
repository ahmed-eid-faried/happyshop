// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/constant/applink.dart';

class TestData {
  Curd curd;
  TestData(this.curd);
  getData() async {
    var response = await curd.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
