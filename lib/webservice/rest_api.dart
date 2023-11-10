import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gweiland_flutter_task/models/currency.dart';

import '../data/Network/base_apiService.dart';
import '../data/Network/network_apiService.dart';
import '../models/logo.dart';
import '../utils/constants.dart';

class RestApi {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<Currency> getCoinData(String sort) async {
    try {
      dynamic response = await _apiServices
          .getApiResponse(ApiEndPoints.getCoinData + "?sort=$sort");
      return Currency.fromJson(response);
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
      throw stacktrace;
    }
  }

  Future<List<String>> getCoinImages(var id) async {
    try {
      List<String> urlList = List.empty(growable: true);
      String url = "${ApiEndPoints.getLogo}?id=${id}";
      dynamic response = await _apiServices.getApiResponse(url);

      dynamic responseData = response["data"];
      debugPrint("Response data is " + responseData.toString());
      var split = id.split(",");

      for (final id in split) {
        var value = responseData["$id"];
        String logoUrl = value["logo"];
        urlList.add(logoUrl);
      }

      return urlList;
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
      throw stacktrace;
    }
  }
}
