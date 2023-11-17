//@dart=2.9
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/models/mtimes.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/models/massignmentfromdetails.dart';
class classgetservicestimes {

  static Future<Map> actionhomecartinvoice(int page) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/homecartinvoice?token='+token;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Mtimes> recordsdata =[];
      responseBody['data']['times']?.forEach((item) {
        recordsdata.add(Mtimes.fromJson(item));
      });
      return {
        "current_page" : 1,
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }




  static Future<Map> actionhomecarttimes(int page) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/homecarttimes?token='+token;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Mtimes> recordsdata =[];
      responseBody['data']['times']?.forEach((item) {
        recordsdata.add(Mtimes.fromJson(item));
      });
      return {
        "current_page" : 1,
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }



  static Future<Map> actiongetassignmentbytimesid(int times_id) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/dettimes?token='+token+'&id=${times_id}';
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      List<Massignmentfromdetails> recordsdata =[];
      responseBody['data']['assignment']?.forEach((item) {
        recordsdata.add(Massignmentfromdetails.fromJson(item));
      });
      return {
        "current_page" : 1,
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }


  static Future<Map> actiongettimes(int page,String sort_upcoming,String jobtitle,int client_id,int department_id,int employee_id,String status,String year,String month,String start_date) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    if(status!='All')
    {
      if(status=='Pending'){
        status='PENDING';
      }
      if(status=='Times sent'){
        status='EMPLOYEE_ACCEPTED';
      }


    }


    String url ='https://mijnzpc.com/api/v1/times?token='+token+'&sort_upcoming=${sort_upcoming}&jobtitle=${jobtitle}&client_id=${client_id}&department_id=${department_id}&employee_id=${employee_id}&status=${status}&year=${year}&month=${month}&start_date=${start_date}&page=${page}';
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






}