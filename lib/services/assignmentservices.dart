//@dart=2.9
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/models/massignment.dart';
import 'package:mijnzpc/models/mupcomingassignment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/models/mimage.dart';
class classgetservicesassignment {


  static Future<Map> actiongetupcomingopenssignment() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/upcomingopenassignment?token='+token;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print('uuuuuuuuuuuuuuu');
      print(responseBody);
      List<Massignment> recordsdata =[];
      responseBody['data']['assignments']?.forEach((item) async {
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





  static Future<Map> actiongetupcomingssignment() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/upcomingassignment?token='+token;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print('uuuuuuuuuuuuuuu');
      print(responseBody);
      List<Massignment> recordsdata =[];
      responseBody['data']['assignments']?.forEach((item) async {
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



  static Future<Map> actiongetimagesadmin(int user_id,String type) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/managedocuments?token='+token+'&id='+user_id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Mimage> recordsdata =[];
      responseBody['data']['image']?.forEach((item) {

        if(type=='optional') {


          if (item['document_title'] == 'riskscan' ||
              item['document_title'] == 'BIG registratie of AGB Code' ||
              item['document_title'] == 'Certificates' ||
              item['document_title'] == 'Copy other documents' ||
              item['document_title'] == 'Company Logo' ||
              item['document_title'] == 'BTW Identification number'){
            recordsdata.add(Mimage.fromJson(item));
          }


        }else{


          if (item['document_title'] != 'riskscan' &&
              item['document_title'] != 'BIG registratie of AGB Code' &&
              item['document_title'] != 'Certificates' &&
              item['document_title'] != 'Copy other documents' &&
              item['document_title'] != 'Company Logo' &&
              item['document_title'] != 'BTW Identification number'){
            recordsdata.add(Mimage.fromJson(item));
          }



        }



       // recordsdata.add(Mimage.fromJson(item));
      });
      return {
        "current_page" : 1,
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }



  static Future<Map> actiongetimages(String type) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/managedocuments?token='+token;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
      List<Mimage> recordsdata =[];
      responseBody['data']['image']?.forEach((item) {

        if(type=='optional') {


          if (item['document_title'] == 'riskscan' ||
              item['document_title'] == 'BIG registratie of AGB Code' ||
              item['document_title'] == 'Certificates' ||
              item['document_title'] == 'Copy other documents' ||
              item['document_title'] == 'Company Logo' ||
              item['document_title'] == 'BTW Identification number'){
            recordsdata.add(Mimage.fromJson(item));
        }


        }else{


          if (item['document_title'] != 'riskscan' &&
              item['document_title'] != 'BIG registratie of AGB Code' &&
              item['document_title'] != 'Certificates' &&
              item['document_title'] != 'Copy other documents' &&
              item['document_title'] != 'Company Logo' &&
              item['document_title'] != 'BTW Identification number'){
            recordsdata.add(Mimage.fromJson(item));
          }



        }





      });
      return {
        "current_page" : 1,
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }




  static Future<Map> actiongetopenassignment(int page,String sort_upcoming,String jobtitle,int client_id,int department_id,int employee_id,String status,String year,String month,String start_date,String suggestionname,String suggestionadminname) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/openassignments?token='+token+'&sort_upcoming=${sort_upcoming}&jobtitle=${jobtitle}&client_id=${client_id}&department_id=${department_id}&employee_id=${employee_id}&status=${status}&year=${year}&month=${month}&start_date=${start_date}&suggestionname=${suggestionname}&suggestionadminname=${suggestionadminname}&page=${page}';
print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body);
        List<Massignment> recordsdata =[];
        responseBody['data']['assignments']?.forEach((item) async {
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


  static Future<Map> actiongetassignment(int page,String sort_upcoming,String jobtitle,int client_id,int department_id,int employee_id,String status,String year,String month,String start_date) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/assignments?token='+token+'&sort_upcoming=${sort_upcoming}&jobtitle=${jobtitle}&client_id=${client_id}&department_id=${department_id}&employee_id=${employee_id}&status=${status}&year=${year}&month=${month}&start_date=${start_date}&page=${page}';
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