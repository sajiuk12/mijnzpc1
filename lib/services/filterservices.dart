//@dart=2.9
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/models/filters/mfilterdepartment.dart';
import 'package:mijnzpc/models/filters/mfilteryear.dart';
import 'package:mijnzpc/models/filters/mfiltermonth.dart';
import 'package:mijnzpc/models/filters/mfilterjobtitle.dart';
import 'package:mijnzpc/models/filters/mfiltersort.dart';
import 'package:mijnzpc/models/filters/mfilterstartdate.dart';
import 'package:mijnzpc/models/filters/mfilterstatusassignment.dart';
import 'package:mijnzpc/models/maggrement.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'package:mijnzpc/models/filters/mfilterclient.dart';
import 'package:mijnzpc/models/filters/mfilteremployee.dart';
import 'package:mijnzpc/models/mdocuments.dart';
import 'package:mijnzpc/models/memployees.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/models/mtest.dart';
import 'package:mijnzpc/all_translations.dart';
class classfilterservices
{

  static Future<Map> actiongetfilterdocuments(String title) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/filterdocumentinfo?token='+token+"&title="+title;
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body)['data'];
      List<Mdocuments> recordsdata =[];
      responseBody['document']?.forEach((item) {
        //item['title']=allTranslations.text(item['title']);
        recordsdata.add(Mdocuments.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }






  static Future<Map> actiongetdepartmentfiltersbyclientselecter(String title,String clientid,String registeras) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    // String url ='https://mijnzpc.com/api/v1/filterdepartment?token='+token+"&title="+title;
    String url ='https://mijnzpc.com/api/v1/filterdepartmentbyclientselecter?token='+token+'&client_id='+clientid+"&title="+title+"&registeras="+registeras;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body)['data'];
      List<Mfilterdepartment> recordsdata =[];
      responseBody['deparments']?.forEach((item) {
        recordsdata.add(Mfilterdepartment.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }

  static Future<Map> actiongetclientselecter(String company_name,String registeras) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    print(token);
    String url ='https://mijnzpc.com/api/v1/filterclientselecter?token='+token+"&company_name="+company_name+"&registeras="+registeras;
    print(url);
    final response = await http.get(Uri.parse(url),);

    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      print(responseBody);
      List<Mfilterclient> recordsdata =[];
      responseBody['clients']?.forEach((item) {
        //var image = json.decode(item['product_pic']);
        //image=image['images']['300'];
        //item['product_pic']='http://immer-kauf.de'+image;
        recordsdata.add(Mfilterclient.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }


  static Future<Map> actionfilteremployeeforinsertassignment(String title,String department_id,String client_id,String jobtitle_id) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String url ='https://mijnzpc.com/api/v1/filteremployeeforinsertassignment?token='+token+'&department_id='+department_id.toString()+'&client_id='+client_id.toString()+'&registeras='+jobtitle_id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body)['data'];
      List<Memployees> recordsdata =[];
      responseBody['employees']?.forEach((item) {
        recordsdata.add(Memployees.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }






  static Future<Map> actiongetagreementfilters(String title,String department_id,String client_id,String jobtitle_id) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    // String url ='https://mijnzpc.com/api/v1/filterdepartment?token='+token+"&title="+title;
   // String url ='https://mijnzpc.com/api/v1/filterdepartmentbyclient?token='+token+"&title="+title;

    String url ='https://mijnzpc.com/api/v1/filteragreemenybyclient?token='+token+'&department_id='+department_id.toString()+'&client_id='+client_id.toString()+'&registeras='+jobtitle_id.toString();
    print(url);

    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body)['data'];
      List<Maggrement> recordsdata =[];
      responseBody['preaggrement']?.forEach((item) {
        recordsdata.add(Maggrement.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }




  static Future<Map> actiongetdepartmentfiltersbyclient(String title,String clientid) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    // String url ='https://mijnzpc.com/api/v1/filterdepartment?token='+token+"&title="+title;
    String url ='https://mijnzpc.com/api/v1/filterdepartmentbyclient?token='+token+'&client_id='+clientid+"&title="+title;
print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body)['data'];
      List<Mfilterdepartment> recordsdata =[];
      responseBody['deparments']?.forEach((item) {
        recordsdata.add(Mfilterdepartment.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }

  static Future<Map> actiongetstart_datefilters(String title) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    print(token);
    String url ='https://mijnzpc.com/api/v1/filterstartdate?token='+token+"&start_date="+title;
    final response = await http.get(Uri.parse(url),);

    if(response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body)['data'];

      List<Mfilterstartdate> recordsdata =[];

      responseBody['filterstartdate']?.forEach((item) {
        if(item['start_date']!=null)
          {
            recordsdata.add(Mfilterstartdate.fromJson(item));
          }

      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }





  static Future<Map> actiongetstatusassfilters(String title,String page) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/filterstatusassignment?token='+token+"&title="+title+'&page='+page;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body)['data'];
      List<Mfilterstatusassignment> recordsdata =[];
      responseBody['filterstatusassignment']?.forEach((item) {
        recordsdata.add(Mfilterstatusassignment.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }


  static Future<Map> actiongetsortfilters(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url = 'https://mijnzpc.com/api/v1/filtersort?token=' + token + "&title=" + title;
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body)['data'];
      List<Mfiltersort> recordsdata = [];
      responseBody['sort']?.forEach((item) {
        recordsdata.add(Mfiltersort.fromJson(item));
      });
      return {
        "current_page": responseBody['current_page'],
        "recordsdata": recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }

  static Future<Map> actiongetjobtitlefilters(String title) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/filterjobtitle?token='+token+"&title="+title;
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body)['data'];
      List<Mfilterjobtitle> recordsdata =[];
      responseBody['jobtitle']?.forEach((item) {
        //item['title']=allTranslations.text(item['title']);
        recordsdata.add(Mfilterjobtitle.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }




  static Future<Map> actiongetmonthfilters(String title) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/filtermonth?token='+token+"&title="+title;
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body)['data'];
      List<Mfiltermonth> recordsdata =[];
      responseBody['filtermonth']?.forEach((item) {
        recordsdata.add(Mfiltermonth.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }



  static Future<Map> actiongetyearfilters(String title) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/filteryear?token='+token+"&title="+title;
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body)['data'];
      List<Mfilteryear> recordsdata =[];
      responseBody['filteryear']?.forEach((item) {
        recordsdata.add(Mfilteryear.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }


  static Future<Map> actiongetdepartmentfilters(String title) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/filterdepartment?token='+token+"&title="+title;
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body)['data'];
      List<Mfilterdepartment> recordsdata =[];
      responseBody['deparments']?.forEach((item) {
        recordsdata.add(Mfilterdepartment.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }







  static Future<Map> actiongetemployeefilters(String first_name,String last_name) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/filteremployee?token='+token+"&first_name="+first_name+"&last_name="+last_name;
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      List<Mfilteremployee> recordsdata =[];
      responseBody['employees']?.forEach((item) {
        recordsdata.add(Mfilteremployee.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }




  static Future<Map> actiongetclientfilters(String company_name) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    print(token);
    String url ='https://mijnzpc.com/api/v1/filterclient?token='+token+"&company_name="+company_name;
    print(url);
    final response = await http.get(Uri.parse(url),);

    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      print(responseBody);
      List<Mfilterclient> recordsdata =[];
      responseBody['clients']?.forEach((item) {
        //var image = json.decode(item['product_pic']);
        //image=image['images']['300'];
        //item['product_pic']='http://immer-kauf.de'+image;
        recordsdata.add(Mfilterclient.fromJson(item));
      });
      return {
        "current_page" : responseBody['current_page'],
        "recordsdata" : recordsdata
      };
    }
    var responseBody = json.decode(response.body);
    return responseBody;
  }


  static Future<Map> actiongetclients() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/filterclient?token='+token;
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      print(responseBody);
      List<User> recordsdata =[];
      responseBody['clients']?.forEach((item) {
        recordsdata.add(User.fromJson(item));
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