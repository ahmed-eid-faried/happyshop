import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/constant/applink.dart';

class AddressData {
  Curd curd;
  AddressData(
    this.curd,
  );
  addAddress(
    String userid,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await curd.postData(AppLink.addressadd, {
      "userid": userid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(String? addressid) async {
    var response =
        await curd.postData(AppLink.addressdelete, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }

  viewAddress(String? userid) async {
    var response = await curd.postData(AppLink.addressview, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  editAddress(
    String addressid,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await curd.postData(AppLink.addressedit, {
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
      "addressid": addressid
    });
    return response.fold((l) => l, (r) => r);
  }
}
