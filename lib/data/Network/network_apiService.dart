
import 'dart:convert';
import 'dart:io';
import 'package:gweiland_flutter_task/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'package:gweiland_flutter_task/data/Network/base_apiService.dart';
import 'package:gweiland_flutter_task/data/app_exception.dart';
import 'package:http/http.dart';

import 'package:pretty_http_logger/src/logger/log_level.dart';
import 'package:pretty_http_logger/src/logger/logging_middleware.dart';
import 'package:pretty_http_logger/src/middleware/http_client_with_middleware.dart';
import 'package:pretty_http_logger/src/middleware/http_with_middleware.dart';

class NetworkApiService extends BaseApiServices{

  static final HttpWithMiddleware _httpClient =
  HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.NONE),
  ]);

  static final HttpClientWithMiddleware _streamedHttpClient =
  HttpClientWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.NONE),
  ]);

  Future<StreamedResponse> send(BaseRequest request) async {
    final response = await _streamedHttpClient.send(request);
    return response;
  }

  @override
  Future getApiResponse(String url) async{
    dynamic responseJson;
    try{

      final response = await http.get(Uri.parse(url),
          headers: {
            'X-CMC_PRO_API_KEY': Constants.apiKey,
            'Accept':"application/json"
          }
      );
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, data) {
    // TODO: implement getPostApiResponse
    throw UnimplementedError();
  }


  dynamic returnResponse(http.Response response){

    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error while communicating with the server'+'with status code'+response.statusCode.toString());
    }
  }


}