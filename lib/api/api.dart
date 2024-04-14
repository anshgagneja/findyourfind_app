import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

import '../helper/pref.dart';

class Api {
  final BuildContext context;
  final padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
  var log = '';

  static const internetError = 'internetError';
  static const defaultError = 'defaultError';
  static const loading = 'loading';
  static const authError = 'authError';
  static const warning = 'warning';
  static const success = 'success';
  static const locationError = 'locationError';
  static const timeError = 'timeError';

  static const BaseUrl = 'http://findyourfind.shop/api/api.php';
  static const gpsError = 'gpsError';

  Api(this.context);


  Future getUserAddressList(String userid) async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "GET_USER_ADDRESS",
          'user_id': userid,
        },
      );
      if (response.statusCode == 200) {
        if(jsonDecode(response.body)["success"] == true){

        }else{
          apiSnackBar(jsonDecode(response.body)["message"].toString(),0);
        }
        return jsonDecode(response.body)["data"];
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }



  Future getOrderList(String userid) async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "ORDER_LIST",
          'user_id': userid,
        },
      );
      if (response.statusCode == 200) {
        if(jsonDecode(response.body)["success"] == true){

        }else{
          apiSnackBar(jsonDecode(response.body)["message"].toString(),0);
        }
        return jsonDecode(response.body)["data"];
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }


  Future getCartList(String userid) async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "CART_LIST",
          'user_id': userid,
        },
      );
      if (response.statusCode == 200) {
        if(jsonDecode(response.body)["success"] == true){

        }else{
          apiSnackBar(jsonDecode(response.body)["message"].toString(),0);
        }
        return jsonDecode(response.body)["data"];
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }

  Future AddToCart(String userid,String pid) async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "ADD_TO_CART",
          'user_id': userid,
          'pid': pid,
        },
      );



      if (response.statusCode == 200) {
        if(jsonDecode(response.body)["success"] == true){
          return jsonDecode(response.body)["data"];
        }else{
          apiSnackBar(jsonDecode(response.body)["message"].toString(),0);
        }
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }

  Future updateFavorites(String userid,String pid) async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "UPDATE_FAV_UNFAV",
          'user_id': userid,
          'pid': pid,
        },
      );



      if (response.statusCode == 200) {
        if(jsonDecode(response.body)["success"] == true){
          return jsonDecode(response.body)["data"];
        }else{
          apiSnackBar(jsonDecode(response.body)["message"].toString(),0);
        }
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }

  Future getFavorites(String userid) async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "FAVORITES",
          'user_id': userid,
        },
      );



      if (response.statusCode == 200) {
        if(jsonDecode(response.body)["success"] == true){
          return jsonDecode(response.body)["data"];
        }else{
          apiSnackBar(jsonDecode(response.body)["message"].toString(),0);
        }
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }


  Future getProducts(String userid) async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "PRODUCTS",
          'user_id': userid,
        },
      );



      if (response.statusCode == 200) {
        if(jsonDecode(response.body)["success"] == true){
          return jsonDecode(response.body)["data"];
        }else{
          apiSnackBar(jsonDecode(response.body)["message"].toString(),0);
        }
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }


  Future PlaceOrder(String address,String state,String city,String zip,String user_id) async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "PLACE_ORDER_USER",
          'address': address,
          'state': state,
          'city': city,
          'zip': zip,
          'user_id': user_id,
        },
      );
      if (response.statusCode == 200) {
        if(jsonDecode(response.body)["success"] == true){
          return jsonDecode(response.body)["data"];
        }else{
          apiSnackBar(jsonDecode(response.body)["message"].toString(),0);
        }
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }

  Future Register(String username,String password,String mobile,String name) async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "REGISTER",
          'useremail': username,
          'password': password,
          'mobile': mobile,
          'name': name,
        },
      );
      if (response.statusCode == 200) {
        if(jsonDecode(response.body)["success"] == true){
          apiSnackBar(jsonDecode(response.body)["message"].toString(),1);
        }else{
          apiSnackBar(jsonDecode(response.body)["message"].toString(),0);
        }
        return jsonDecode(response.body)["data"];
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }


  Future Login(String username,String password) async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "LOGIN",
          'useremail': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        if(jsonDecode(response.body)["success"] == true){
          apiSnackBar(jsonDecode(response.body)["message"].toString(),1);
        }else{
          apiSnackBar(jsonDecode(response.body)["message"].toString(),0);
        }
        return jsonDecode(response.body)["data"];
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }


  Future getNotifyData() async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "GET_NOTIFICATIONS",
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['Data'];
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }

  Future getVacData() async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "GET_VACATION_DETAILS",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['Data'];
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }
  Future getArchiveData(String limit) async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "GET_UWA_ARCHIVES",
          'start_limit': limit.isEmpty ? '1' : limit,
        },

      );
      print({
        'action': "GET_UWA_ARCHIVES",
        'start_limit': limit.isEmpty ? '1' : limit,
      });
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['Data'];
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }
  Future getTicketData(String limit) async {
    try {
      String uri = BaseUrl;
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Accept': 'application/json'},
        body: {
          'action': "GET_UWA_TIPS",
          limit.isEmpty ? '0' : 'start_limit': limit.isEmpty ? '1' : limit,
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['Data'];
      }
      else if (response.statusCode == 401) {
        return authError;
      } else {
        return defaultError;
      }
    } on SocketException {
      return internetError;
    } catch (e) {
      return defaultError;
    }
  }

  _encodeUrl(Map<String, dynamic> map) {
    String encoded = '';

    map.forEach((k, v) {
      encoded = '$encoded&$k=$v';
    });

    return encoded;
  }

  apiLog(Object? object, {flag = false}) {
    log = '$log\n${object ?? 'null'}';

    if (flag) {
      return;
    }

    dev.log(log);
  }

  apiSnackBar(String msg, int colorCode) {
    var bg = Colors.green;

    switch (colorCode) {
      case 0:
        bg = Colors.red;
        break;
      case 1:
        bg = Colors.green;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        padding: padding,
        backgroundColor: bg,
      ),
    );
  }

  static Future<bool> networkAvailable() async {
    final response = await Connectivity().checkConnectivity();

    return response == ConnectivityResult.mobile ||
        response == ConnectivityResult.wifi;
  }
}
