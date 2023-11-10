import 'package:flutter/cupertino.dart';

import '../models/currency.dart';
import '../models/logo.dart';
import '../webservice/rest_api.dart';

class LogoProvider extends ChangeNotifier {
  List<String>? logoUrl = [];
  bool isLoading = true;
  bool isNoData = false;
  bool isError = false;

  getCoinData(id) {
    debugPrint("Triggering api.. in get coin data.dart method..");
    /*RestApi().getCoinImages(id).then((value) {
      isLoading = false;

      if (value.isNotEmpty) {
        isNoData = false;
        logoUrl!.add(value);
      } else {
        isNoData = true;
      }
      notifyListeners();
    }).catchError((onError) {
      isLoading = false;
      isError = true;
      notifyListeners();
    });*/
  }


}