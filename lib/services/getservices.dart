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
class classgetservices {

  static Future<Map> actiongetallassignment() async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/allassignments?token='+token;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print('ssssssssssssss');
      print(responseBody);
      List<Massignment> recordsdata =[];
      responseBody['data']['Assignment']?.forEach((item) {
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














  static Future<Map> actiongetagreements(int page,String client_id,String title,String registeras) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/agreements?page='+page.toString()+'&token='+token+'&client_id=${client_id}&title=${title}&registeras=${registeras}';

    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      List<Maggrement> recordsdata =[];
      responseBody['data']['aggrement']['data']?.forEach((item) {
        recordsdata.add(Maggrement.fromJson(item));
      });
      return {
        "current_page" : responseBody['data']['aggrement']['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }




  static Future<Map> actiongetdepartments(int page,String client_id,String title) async
  {
    if(client_id=='-1')
      {
        client_id='';
      }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/departments?page=${page}&token='+token+'&client_id=${client_id}&title=${title}';
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print('ssssssssssssss');
      print(responseBody);
      List<Mdepartments> recordsdata =[];
      responseBody['data']['departments']['data']?.forEach((item) {
        recordsdata.add(Mdepartments.fromJson(item));
      });
      return {
        "current_page" : responseBody['data']['departments']['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }




  static Future<Map> actiongetnotification() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    // String url ='https://mijnzpc.com/api/v1/users/employees?token='+token+'&sort_upcoming=${sort_upcoming}&jobtitle=${jobtitle}&client_id=${client_id}&department_id=${department_id}&employee_id=${employee_id}&status=${status}&year=${year}&month=${month}&start_date=${start_date}&page=${page}';
    String url ='https://mijnzpc.com/api/v1/notifs?token='+token;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      List<Mnotifications> recordsdata =[];
      responseBody['data']['Nonifs']?.forEach((item) {
        recordsdata.add(Mnotifications.fromJson(item));
      });
      return {
        "current_page" : 1,
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }



 
  static Future<Map> actiongetaddress(String text) async
  {

    String url ='https://mijnzpc.com/api/v1/getaddress?tt='+text;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      List<Maddress> recordsdata =[];
      responseBody['features']?.forEach((item) {
        recordsdata.add(Maddress.fromJson(item['properties']));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }



  static Future<Map> actiongetbasket(int page) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='http://immer-kauf.de/api/v1/basket?token='+token;

    final response = await http.get(Uri.parse(url),);

    // final response = await http.get('http://immer-kauf.de/api/v1/basket?token='+token);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      List<Mbasket> recordsdata =[];
      responseBody['data']?.forEach((item) {
        // print(item);
        var image = json.decode(item['product_pic']);
        image=image['images']['300'];
        item['product_pic']='http://immer-kauf.de'+image;
        recordsdata.add(Mbasket.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }




  static Future<Map> actiongetstrommetr(int page) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='http://immer-kauf.de/api/v1/getstrommetr?token='+token;

    final response = await http.get(Uri.parse(url),);

    // final response = await http.get('http://immer-kauf.de/api/v1/basket?token='+token);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      List<Mstrommetr> recordsdata =[];
      responseBody['data']?.forEach((item) {
        // print(item);

        recordsdata.add(Mstrommetr.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }











}