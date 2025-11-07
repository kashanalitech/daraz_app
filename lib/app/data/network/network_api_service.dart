import 'dart:convert';
import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../repsonse/app_exceptions.dart';
import '../user_prefernce/user_prefrence_view_model.dart';
import 'base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  final UserPreference _userPreference = Get.find<UserPreference>();

  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: getHeaders())
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } catch (e, stackTrace) {
      print("Unexpected Error: $e");
      print("Stack Trace: $stackTrace");
      return {"error": "Unexpected error occurred"}; // Avoid app crash
    }

    print(responseJson);
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print("Request URL: $url");
      print("Request Data: $data");
    }

    dynamic responseJson;
    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: getHeaders(),
        body: jsonEncode(data),
      )
          .timeout(const Duration(seconds: 20)); // Increased timeout

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet Connection');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timed Out');
    } catch (e, stackTrace) {
      print("Unexpected Error: $e");
      print("Stack Trace: $stackTrace");
      return {"error": "Unexpected error occurred"}; // Avoid app crash
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  // Future<dynamic> postApi(var data, String url) async {
  //   if (kDebugMode) {
  //     print("Request URL: $url");
  //     print("Request Data: $data");
  //   }
  //
  //   dynamic responseJson;
  //   try {
  //     final response = await http
  //         .post(
  //           Uri.parse(url),
  //           headers: {
  //             "Access-Control-Allow-Origin": "*",
  //             'Content-Type': 'application/json',
  //             'Accept': '*/*'
  //           },
  //           body: jsonEncode(data), // Encode to JSON string
  //         )
  //         .timeout(const Duration(seconds: 10));
  //
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw InternetException('No Internet Connection');
  //   } on RequestTimeOut {
  //     throw RequestTimeOut('Request Timed Out');
  //   } catch (e,stackTrace) {
  //     print("Unexpected Error: $e");
  //     print("Stack Trace: $stackTrace");
  //     rethrow;
  //   }
  //
  //   if (kDebugMode) {
  //     print(responseJson);
  //   }
  //   return responseJson;
  // }

  @override
  Future<dynamic> putApiResponse(var data, String url) async {
    if (kDebugMode) {
      print("PUT Request URL: $url");
      print("PUT Request Data: $data");
    }

    dynamic responseJson;
    try {
      final response = await http
          .put(
        Uri.parse(url),
        headers: getHeaders(),
        body: jsonEncode(data),
      )
          .timeout(const Duration(seconds: 20));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet Connection');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timed Out');
    } catch (e, stackTrace) {
      print("Unexpected Error: $e");
      print("Stack Trace: $stackTrace");
      return {"error": "Unexpected error occurred"};
    }

    if (kDebugMode) print(responseJson);
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
    }

    try {
      switch (response.statusCode) {
        case 200:
        case 201:
          return response.body.isNotEmpty
              ? jsonDecode(response.body)
              : {"message": "Success"};

        case 400:
        case 401:
        case 403:
        case 422:
        // ✅ Common client errors - return decoded body for error parsing
          return response.body.isNotEmpty
              ? jsonDecode(response.body)
              : {
            "successful": false,
            "errors": ["Unknown client error"]
          };
        default:
          throw FetchDataException(
              'Error occurred while communicating with server ${response.statusCode}');
      }
    } catch (e) {
      throw FetchDataException('Error parsing response: ${e.toString()}');
    }
  }

  getHeaders() {
    return {
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Bearer ${UserPreference.userToken}",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };
  }
}
