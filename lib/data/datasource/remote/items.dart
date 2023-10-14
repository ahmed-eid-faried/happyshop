// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/constant/applink.dart';

class ItemsData {
  Curd curd;
  ItemsData(
    this.curd,
  );
  getData(String categoryId, String? userid) async {
    var response = await curd.postData(
        AppLink.items, {"categoriesid": categoryId, "userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
