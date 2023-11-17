//@dart=2.9
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/models/musers.dart';
import 'package:mijnzpc/models/memployees.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/models/msuggestion.dart';
class classgadminservices {

  static Future<Map> actiongetsuggestions(int assignment_id) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/showsugestions?token='+token+'&id='+assignment_id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Msuggestion> recordsdata =[];
      responseBody['data']['suggestionassignments']['data']?.forEach((item) {
        recordsdata.add(Msuggestion.fromJson(item));
      });
      return {
        "current_page" :1,
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }

  static Future<Map> actiongetfreelancers(int page,String sort_upcoming,String jobtitle,int client_id,int department_id,int employee_id,String status,String year,String month,String start_date,String employeenameforserver,String employeelastnameforserver) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

   // String url ='https://mijnzpc.com/api/v1/users/employees?token='+token+'&sort_upcoming=${sort_upcoming}&jobtitle=${jobtitle}&client_id=${client_id}&department_id=${department_id}&employee_id=${employee_id}&status=${status}&year=${year}&month=${month}&start_date=${start_date}&page=${page}';
    String url ='https://mijnzpc.com/api/v1/users/employees?token='+token+'&page='+page.toString()+'&first_name='+employeenameforserver+'&last_name='+employeelastnameforserver+'&status='+status+'&jobtitle='+jobtitle;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Memployees> recordsdata =[];
      responseBody['data']['employees']['data']?.forEach((item) {
        recordsdata.add(Memployees.fromJson(item));
      });
      return {
        "current_page" : responseBody['data']['employees']['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }


  static Future<Map> actiongetadmins(int page) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/users/admins?token='+token;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Musers> recordsdata =[];
      responseBody['data']['admins']?.forEach((item) {
        recordsdata.add(Musers.fromJson(item));
      });
      return {
        "current_page" :1,
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }


  static Future<Map> actiongetclients(int page) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/users/clients?page=${page}&token='+token;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Musers> recordsdata =[];
      responseBody['data']['clients']['data']?.forEach((item) {
        recordsdata.add(Musers.fromJson(item));
      });
      return {
        "current_page" : responseBody['data']['clients']['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }


  static Future<Map> actiongetfinancials(int page) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/clients/departments/financial?token='+token;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Musers> recordsdata =[];
      responseBody['data']['financials']?.forEach((item) {
        recordsdata.add(Musers.fromJson(item));
      });
      return {
        "current_page" : 1,
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }

  static Future<Map> actiongetscheduls(int page) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/clients/departments/schedule?token='+token;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Musers> recordsdata =[];
      responseBody['data']['schedules']?.forEach((item) {
        recordsdata.add(Musers.fromJson(item));
      });
      return {
        "current_page" : 1,
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }


}