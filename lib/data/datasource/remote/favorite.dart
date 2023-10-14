// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/constant/applink.dart';

class FavoriteData {
  Curd curd;
  FavoriteData(
    this.curd,
  );
  addFavorite(String? userid, String? itemsid) async {
    var response = await curd
        .postData(AppLink.favoriteadd, {"userid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String? userid, String? itemsid) async {
    var response = await curd.postData(
        AppLink.favoriteremove, {"userid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
