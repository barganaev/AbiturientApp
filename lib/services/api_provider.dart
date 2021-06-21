import 'dart:convert';
import 'dart:developer';

import 'package:abiturient_app/models/FAQ_model.dart';
import 'package:abiturient_app/models/all_colleges_model.dart';
import 'package:abiturient_app/models/colleges_by_region_model.dart';
import 'package:abiturient_app/models/login_model.dart';
import 'package:abiturient_app/models/detail_order_model.dart';
import 'package:abiturient_app/models/my_orders.dart';
import 'package:abiturient_app/models/news_model.dart';
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
  news,
  faq,
}

class ApiProvider {
  var _token;
  var _box = Hive.box('myBox');
  Future<dynamic> requestPost(
    RequestNames requestName, {
    String ecpFile,
    String password,
    String ab,
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
          log(response.statusCode.toString(), name: "Status");
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
          // log(response.body.toString(), name: "dataBody");
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
          log(response.body.toString(), name: "REGIONS");
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
            Uri.parse(COLLEGES_BY_REGION + ab),
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
      case RequestNames.news:
        try {
          final response = await http.get(
            Uri.parse(NEWS),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            // body: jsonEncode(
            //   <String, String>{
            //     'page': "1",
            //     'lang': "kk",
            //   },
            // ),
          );
          // log(response.body.toString(), name: "COLLEGES_BY_REGION");
          responseJson = _response(response, requestName);
        } catch (e) {
          log(e.toString());
          return e;
        }
        return responseJson;
        break;
      case RequestNames.faq:
        try {
          final response = await http.get(
            Uri.parse(FAQ),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
          );
          log(response.body.toString(), name: "RequestNames.faq");
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
          // DetailOrderModel _detailOrderModel =
          //     detailOrderModelFromJson(response.bodyBytes);
          String res = utf8.decode(response.bodyBytes);
          return res;
        } else if (requestname == RequestNames.myOrders) {
          log("here", name: "HERE i am");
          // MyOrdersModel _myOrdersModel =
          //     myOrdersModelFromJson(response.bodyBytes);
          String res = utf8.decode(response.bodyBytes);
          // dynamic res = json.decode(utf8.decode(response.bodyBytes)));
          // log(res.toString(), name: "RequestNames.myOrders");

          return res;
          // return _myOrdersModel;
        } else if (requestname == RequestNames.allColleges) {
          AllCollegesModel _allCollegesModel =
              allCollegesModelFromJson(response.bodyBytes);
          return _allCollegesModel;
        } else if (requestname == RequestNames.regions) {
          RegionsModel _regionsModel = regionsModelFromJson(response.bodyBytes);
          log(_regionsModel.toJson().toString(), name: "regions");

          return _regionsModel;
        } else if (requestname == RequestNames.collegesByRegion) {
          CollegesByRegionModel _collegesByRegionModel =
              collegesByRegionModelFromJson(response.bodyBytes);
          log(_collegesByRegionModel.toJson().toString(),
              name: "COLLEGES_BY_REGION");

          return _collegesByRegionModel;
        } else if (requestname == RequestNames.news) {
          NewsModel _newsModel = newsModelFromJson(response.bodyBytes);
          log(_newsModel.toJson().toString(), name: "RequestNames.news");
          return _newsModel;
        } else if (requestname == RequestNames.faq) {
          FaqModel _faqModel = faqModelFromJson(response.bodyBytes);
          log(_faqModel.toJson().toString(), name: "RequestNames.faq");
          return _faqModel;
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
