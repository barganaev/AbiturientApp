import 'dart:convert';
import 'dart:developer';

import 'package:abiturient_app/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

enum RequestNames {
  login,
}

class ApiProvider {
  var token;
  var box = Hive.box('myBox');
  Future<dynamic> requestPost(
    RequestNames requestName, {
    String ecpFile,
    String password,
  }) async {
    var responseJson;

    if (box.containsKey('token')) {
      this.token = box.get('token');
    }
    switch (requestName) {
      case RequestNames.login:
        try {
          final response = await http.post(
            Uri.parse(LOGIN_REQUEST),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'p12': ecpFile,
              'password': password,
            }),
          );
          // log("after post");
          // log(response.headers["authorization"]);
          String tokenToPut = response.headers["authorization"];
          this.box.put('token', tokenToPut);
          // log(json.decode(response.body).toString());
          responseJson = _response(response, requestName);
        } catch (e) {
          log(e.toString());
          return e;
        }
        // log("before return response");
        return responseJson;
        break;
      default:
        return Exception();
    }
  }

  dynamic _response(http.Response response, RequestNames requestname) {
    switch (response.statusCode) {
      case 200:
        // if (requestname == RequestNames.login) {
        //   LoginModel _loginModel = loginModelFromJson(response.bodyBytes);
        //   // log(_loginModel.data.birthDate);
        //   return _loginModel;
        // }
        break;
      case 400:
        log("IN THE 404");
        throw Exception("JACKSON");
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
