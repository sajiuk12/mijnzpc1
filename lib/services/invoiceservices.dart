//@dart=2.9
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/models/minvoice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'package:mijnzpc/models/massignmentfromdetails.dart';
class classgetservicesinvoice {


  static Future<Map> actiongetassignmentbyinvoiceid(int invoice_id) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/detinvoices?token='+token+'&id=${invoice_id}';
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



  static Future<Map> actiongetinvoices(int page,String sort_upcoming,String jobtitle,int client_id,int department_id,int employee_id,String status,String year,String month,String start_date,String type) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');


    String url ='https://mijnzpc.com/api/v1/invoices?token='+token+'&sort_upcoming=${sort_upcoming}&jobtitle=${jobtitle}&client_id=${client_id}&department_id=${department_id}&employee_id=${employee_id}&status=${status}&year=${year}&month=${month}&start_date=${start_date}&type=${type}&page=${page}';
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      List<Minvoice> recordsdata =[];
      responseBody['data']['invoices']['data']?.forEach((item) {
        recordsdata.add(Minvoice.fromJson(item));
      });
      return {
        "current_page" : responseBody['data']['invoices']['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }



}