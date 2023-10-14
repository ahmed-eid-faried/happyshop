// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/constant/applink.dart';

class ItemDetialsData {
  Curd curd;
  ItemDetialsData(
    this.curd,
  );
  addCart(String? userid, String? itemsid) async {
    var response = await curd
        .postData(AppLink.cartadd, {"userid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String? userid, String? itemsid) async {
    var response = await curd
        .postData(AppLink.cartdelete, {"userid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getData(String? userid) async {
    var response = await curd.postData(AppLink.cartview, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  getcountofitemsCart(String? userid, String? itemsid) async {
    var response = await curd.postData(
        AppLink.cartgetcountofitems, {"userid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  rating(String userid, String itemid, String rating, String comment) async {
    var response = await curd.postData(AppLink.ratingitem, {
      "userid": userid,
      "itemid": itemid,
      "rating": rating,
      "comment": comment
    });
    return response.fold((l) => l, (r) => r);
  }
}
