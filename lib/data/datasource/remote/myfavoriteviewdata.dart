// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/constant/applink.dart';

class MyFavoriteViewData {
  Curd curd;
  MyFavoriteViewData(
    this.curd,
  );
  getdata(String? userid) async {
    var response =
        await curd.postData(AppLink.favoriteview, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  deletedata(String? favoriteId) async {
    var response = await curd
        .postData(AppLink.favoritedelete, {"favorite_id": favoriteId});
    return response.fold((l) => l, (r) => r);
  }
}
