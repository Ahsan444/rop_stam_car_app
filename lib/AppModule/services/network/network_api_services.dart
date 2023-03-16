import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:rop_stam_assignment/AppModule/utils/utils.dart';

import '../exceptions/app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> post(String url, dynamic body) async {
    if(kDebugMode){
      print('---> POST URL: $url');
    }
    dynamic responseJson;
    try {
      final response = await dio.Dio().post(
        url,
        data: body,
      ).timeout(const Duration(seconds: 15));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet Connection');
    } on TimeoutException {
      throw RequestTimeOutException('Request Time Out');
    } on dio.DioError {
      Utils.toastMessage('email is not valid');
      throw BadRequestException('Bad Request');
    } catch (e) {
      throw ServerException('Internal Server Error: $e');
    }
    /*if(kDebugMode){
      print('response:-->  $responseJson');
    }*/
    return responseJson;
  }

  @override
  Future get(String url) async {
    if(kDebugMode){
      print('---> URL: $url');
    }
    dynamic responseJson;
    try {
      final response = await dio.Dio().get(
        url,
      ).timeout(const Duration(seconds: 15));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet Connection');
    } on TimeoutException {
      throw RequestTimeOutException('Request Time Out');
    } on dio.DioError {
      throw BadRequestException('Bad Request');
    } catch (e) {
      throw ServerException('Internal Server Error: $e');
    }
    if(kDebugMode){
      print('responseGet:-->  $responseJson');
    }
    return responseJson;
  }

  returnResponse(dio.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 400:
        dynamic responseJson = response.data;
        return responseJson;
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
