// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/constant/applink.dart';

class ArchiveOrdersData {
  Curd curd;
  ArchiveOrdersData(this.curd);

  viewOrders(String userid) async {
    var response =
        await curd.postData(AppLink.archiveorder, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  rating(String ordersid, String rating, String comment) async {
    var response = await curd.postData(AppLink.ratingorder,
        {"ordersid": ordersid, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }
}
