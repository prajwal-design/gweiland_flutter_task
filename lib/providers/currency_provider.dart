import 'package:flutter/cupertino.dart';

import '../models/currency.dart';
import '../webservice/rest_api.dart';

class CurrencyProvider extends ChangeNotifier {
  Currency? data;
  bool isLoading = true;
  bool isNoData = false;
  bool isError = false;
  List<String>? logoUrl = [];

  getCoinData(sort) {
    debugPrint("Triggering api.. in get coin data.dart method..");
    RestApi().getCoinData(sort).then((value) {
      isLoading = false;
      debugPrint("value present " + value.toString());
      if (value != null) {
        if (value.data == null) {
          isNoData = true;
        } else {
          Iterable<Data> currencyList = value.data!.take(20);
          data = value;
          data!.data = currencyList.toList();
          debugPrint("length of data " + value.data!.length.toString());
        }
        getLogoData(data!.data);
        notifyListeners();
      } else {
        isNoData = true;
        notifyListeners();
      }
    }).catchError((onError) {
      isLoading = false;
      isError = true;
      notifyListeners();
    });
  }

  getLogoData(List<Data>? list) {
    String ids = getCommaSeparatedIds(list);

    RestApi().getCoinImages(ids).then((value) {
      isLoading = false;

      if (value.isNotEmpty) {
        isNoData = false;
        logoUrl = value;
      } else {
        isNoData = true;
      }
      notifyListeners();
    }).catchError((onError) {
      isLoading = false;
      isError = true;
      notifyListeners();
    });
  }



  String getCommaSeparatedIds(List<Data>? list) {
    List<int?> idList = list!.map((e) => e.id).toList(growable: true);
    debugPrint("Id List ..." + idList.toString());
    return idList.join(",");
  }
}
