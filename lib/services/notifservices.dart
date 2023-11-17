//@dart=2.9
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/models/massignment.dart';
import 'package:mijnzpc/models/mbasket.dart';
import 'package:mijnzpc/models/maggrement.dart';
import 'package:mijnzpc/models/mdepartments.dart';
import 'package:mijnzpc/models/maddress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/models/mstrommetr.dart';
import 'package:mijnzpc/models/mnotifs.dart';
import 'package:mijnzpc/models/mtimes.dart';
import 'package:mijnzpc/models/musers.dart';
import 'package:mijnzpc/models/memployees.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/models/msuggestion.dart';
class notifservices {

//its suggestions
  static Future<Map> actiongetRegistrationnewc(String id) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    // String url ='https://mijnzpc.com/api/v1/users/employees?token='+token+'&sort_upcoming=${sort_upcoming}&jobtitle=${jobtitle}&client_id=${client_id}&department_id=${department_id}&employee_id=${employee_id}&status=${status}&year=${year}&month=${month}&start_date=${start_date}&page=${page}';
    String url ='https://mijnzpc.com/api/v1/users/employees?getoneid=1&token='+token+'&id='+id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Musers> recordsdata =[];
      responseBody['data']['employees']?.forEach((item) {
        recordsdata.add(Musers.fromJson(item));
      });
      return {
        "current_page" : responseBody['data']['employees'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }

//its suggestions
  static Future<Map> actiongetRegistrationnew(String id) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    // String url ='https://mijnzpc.com/api/v1/users/employees?token='+token+'&sort_upcoming=${sort_upcoming}&jobtitle=${jobtitle}&client_id=${client_id}&department_id=${department_id}&employee_id=${employee_id}&status=${status}&year=${year}&month=${month}&start_date=${start_date}&page=${page}';
    String url ='https://mijnzpc.com/api/v1/users/employees?getoneid=1&token='+token+'&id='+id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Memployees> recordsdata =[];
      responseBody['data']['employees']?.forEach((item) {
        recordsdata.add(Memployees.fromJson(item));
      });
      return {
        "current_page" : responseBody['data']['employees'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }











  static Future<Map> actiongetTimesapproved(String id) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');




    String url ='https://mijnzpc.com/api/v1/times?getone=1&token='+token+'&id=${id}';
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Mtimes> recordsdata =[];
      responseBody['data']['times']['data']?.forEach((item) {
        recordsdata.add(Mtimes.fromJson(item));
      });
      return {
        "current_page" : responseBody['data']['times']['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }


  static Future<Map> actiongetNewopenassignment(String id) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/openassignments?getone=1&token='+token+'&id=${id}';
    print('sdsdsdsdsdsd');
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      List<Massignment> recordsdata =[];
      responseBody['data']['assignments']?.forEach((item) {
        recordsdata.add(Massignment.fromJson(item));
      });
      return {
        "current_page" : 1,
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }

  static Future<Map> actiongetNewassignment(String id) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/assignments?getone=1&token='+token+'&id=${id}';
    print('sdsdsdsdsdsd');
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      List<Massignment> recordsdata =[];
      responseBody['data']['assignments']['data']?.forEach((item) {
        recordsdata.add(Massignment.fromJson(item));
      });
      return {
        "current_page" : responseBody['data']['assignments']['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }









}