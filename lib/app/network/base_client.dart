import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openx/app/network/index.dart';


class BaseClient {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(Url.baseUrl + api);
    var headers = {
      'Authorization': 'Bearer ${Url.apiKey}',
    };

    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(Url.baseUrl + api);
    var payload = json.encode(object);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Url.apiKey}',
    };

    var response = await client.post(url, body: payload, headers: headers);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  ///PUT Request
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(Url.baseUrl + api);
    var payload = json.encode(object);
    var headers = {
      'Authorization': 'Bearer ${Url.apiKey}',
      'Content-Type': 'application/json',
    };

    var response = await client.put(url, body: payload, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(Url.baseUrl + api);
    var headers = {
      'Authorization': 'Bearer ${Url.apiKey}',
      'Content-Type': 'application/json',
    };

    var response = await client.delete(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}
