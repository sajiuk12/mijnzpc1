//@dart=2.9
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AuthService {


  Future<Map> sendDataToupdateassignment(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    print(body);
    final response = await http.post(Uri.parse('https://mijnzpc.com/api/v1/updateAssignment?token='+token) ,body : body);

    var responseBody = json.decode(response.body);

    return responseBody;
  }


  Future<Map> sendDataToinsertassignmentemployee(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    print(body);
    final response = await http.post(Uri.parse('https://mijnzpc.com/api/v1/createassignmentemployee?token='+token) ,body : body);

    var responseBody = json.decode(response.body);
    return responseBody;
  }



  Future<Map> sendDataToinsertassignment(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    print(body);
     final response = await http.post(Uri.parse('https://mijnzpc.com/api/v1/createassignmentadmin?token='+token) ,body : body);

      var responseBody = json.decode(response.body);

      return responseBody;
  }




  Future<Map> sendDataToLogin(Map body) async {
    final response = await http.post(Uri.parse('https://mijnzpc.com/api/v1/login') ,body : body);
    var responseBody = json.decode(response.body);
    print(responseBody);
    return responseBody;
  }

    Future<Map> sendDataToRegisteremployee(Map body) async {
    print(body);
   final response = await http.post(Uri.parse('https://mijnzpc.com/api/v1/createEmployee') ,body : body);

   var responseBody = json.decode(response.body);
   print(responseBody);
   return responseBody;
  }

  Future<Map> sendDataToRegisterclient(Map body) async {
    print(body);
    final response = await http.post(Uri.parse('https://mijnzpc.com/api/v1/createClient') ,body : body);

    var responseBody = json.decode(response.body);
    print(responseBody);
    return responseBody;
  }



  static Future<bool> checkApiToken(String apiToken) async {
    final response = await http.get(Uri.parse('http://roocket.org/api/user?api_token=${apiToken}') , headers: { 'Accept' : 'application/json'});

    return response.statusCode == 200;
  }

}