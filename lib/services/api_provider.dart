import 'dart:convert';
import 'dart:developer';

import 'package:abiturient_app/models/all_colleges_model.dart';
import 'package:abiturient_app/models/colleges_by_region_model.dart';
import 'package:abiturient_app/models/login_model.dart';
import 'package:abiturient_app/models/detail_order_model.dart';
import 'package:abiturient_app/models/my_orders.dart';
import 'package:abiturient_app/models/regions_model.dart';
import 'package:abiturient_app/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

enum RequestNames {
  login,
  detailOrder,
  myOrders,
  allColleges,
  collegesByRegion,
  regions,
}
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
      case RequestNames.detailOrder:
        try {
          final response = await http.get(
            Uri.parse(DETAIL_ORDER),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'X-Auth': _token,
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
      case RequestNames.myOrders:
        try {
          final response = await http.get(
            Uri.parse(MY_ORdERS),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'X-Auth': _token,
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
      case RequestNames.allColleges:
        try {
          final response = await http.get(
            Uri.parse(ALL_COLLEGES),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
          );
          log(response.body.toString(), name: "ALL_COLLEGES");
          responseJson = _response(response, requestName);
        } catch (e) {
          log(e.toString());
          return e;
        }
        return responseJson;
        break;
      case RequestNames.regions:
        try {
          final response = await http.get(
            Uri.parse(REGIONS),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
          );
          // log(response.body.toString(), name: "REGIONS");
          responseJson = _response(response, requestName);
        } catch (e) {
          log(e.toString());
          return e;
        }
        return responseJson;
        break;
      case RequestNames.collegesByRegion:
        try {
          final response = await http.get(
            Uri.parse(COLLEGES_BY_REGION),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
          );
          // log(response.body.toString(), name: "COLLEGES_BY_REGION");
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
        } else if (requestname == RequestNames.detailOrder) {
          DetailOrderModel _detailOrderModel =
              detailOrderModelFromJson(response.bodyBytes);
          return _detailOrderModel;
        } else if (requestname == RequestNames.myOrders) {
          MyOrdersModel _myOrdersModel =
              myOrdersModelFromJson(response.bodyBytes);
          return _myOrdersModel;
        } else if (requestname == RequestNames.allColleges) {
          AllCollegesModel _allCollegesModel =
              allCollegesModelFromJson(response.body);
          return _allCollegesModel;
        } else if (requestname == RequestNames.regions) {
          RegionsModel _regionsModel = regionsModelFromJson(response.bodyBytes);
          log(_regionsModel.toJson().toString(), name: "COLLEGES_BY_REGION");

          return _regionsModel;
        } else if (requestname == RequestNames.collegesByRegion) {
          CollegesByRegionModel _collegesByRegionModel =
              collegesByRegionModelFromJson(response.bodyBytes);
          log(_collegesByRegionModel.toJson().toString(),
              name: "COLLEGES_BY_REGION");

          return _collegesByRegionModel;
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
