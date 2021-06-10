import 'dart:convert';
import 'dart:developer';

import 'package:abiturient_app/models/login_model.dart';
import 'package:abiturient_app/models/my_orders.dart';
import 'package:abiturient_app/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

enum RequestNames { login, myOrders }
//{{individual_p12}}

class ApiProvider {
  var _token;
  var _box = Hive.box('myBox');
  Future<dynamic> requestPost(
    RequestNames requestName, {
    String ecpFile,
    String password,
  }) async {
    var responseJson;

    if (_box.containsKey('token')) {
      this._token = _box.get('token');
    }
    switch (requestName) {
      case RequestNames.login:
        try {
          log("logging the post", name: "data");
          log("${ecpFile.length} -- $password", name: "data");
          final response = await http.post(
            Uri.parse(LOGIN_REQUEST),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(
              <String, String>{
                'p12': ecpFile,
                'password': password,
              },
            ),
          );
          log(response.body.toString(), name: "data");
          responseJson = _response(response, requestName);
        } catch (e) {
          log(e.toString());
          return e;
        }
        return responseJson;
        break;
      case RequestNames.myOrders:
        try {
          final response = await http.get(
            Uri.parse(MY_ORDERS),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'X-Auth':
                  'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLmFiaXR1cmllbnQuZWR1cy5reiIsImF1ZCI6Imh0dHBzOlwvXC9hYml0dXJpZW50LmVkdXMua3oiLCJpYXQiOjE2MjMzMDYzMjUsImV4cCI6MTYyMzM5MjcyNSwiaWluIjoiMTIzNDU2Nzg5MDExIiwiYWNjZXNzIjoiYWJpdHVyaWVudCJ9.EsBG0BcSuSU0iDSPKFY9RLCRA34y2F9wGXQXaPL4I2U',
            },
          );
          log(response.body.toString(), name: "dataBody");
          responseJson = _response(response, requestName);
        } catch (e) {
          log(e.toString());
          return e;
        }
        return responseJson;
        break;
      default:
        return Exception();
    }
  }

  dynamic _response(http.Response response, RequestNames requestname) {
    switch (response.statusCode) {
      case 200:
        if (requestname == RequestNames.login) {
          String tokenToPut = response.headers["authorization"];
          this._box.put('token', tokenToPut);
          log(tokenToPut, name: "token");

          LoginModel _loginModel = loginModelFromJson(response.body);
          return _loginModel;
        } else if (requestname == RequestNames.myOrders) {
          MyOrdersModel _myOrdersModel = myOrdersModelFromJson(response.body);
          return _myOrdersModel;
        }
        break;
      case 400:
        log("IN THE 404");
        throw Exception("ASANICHE");
        break;
      // throw BadRequestException(response.body.toString());
      case 401:
        throw Exception();
        break;
      case 403:
        throw Exception();
        break;
      // throw UnauthorisedException(response.body.toString());
      case 500:
        throw Exception();
        break;
      default:
        throw Exception();
        break;
    }
  }
}
