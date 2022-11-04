import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../model/model_rental_mobil.dart';

class data extends ChangeNotifier {
  DbHelper db = DbHelper();
  List allRentalMobil = [];

  Future<dynamic> getData(type) async {
    var list = await db.getAllRentalMobil(!type);
    allRentalMobil.clear();
    list!.forEach((mobil) {
      allRentalMobil.add(ModelRentalMobil.fromMap(mobil));
    });
    return allRentalMobil;
  }
}
