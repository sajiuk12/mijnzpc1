//@dart=2.9
class Mfilteremployee {


  int user_id;
  String first_name;
  String last_name;
  String company_name;
  //num price;



  Mfilteremployee.fromJson(Map<String , dynamic> parsedJson)
  {
    first_name = parsedJson['first_name'];
    last_name = parsedJson['last_name'];
    company_name = parsedJson['company_name'];
    user_id = parsedJson['user_id'];


  }
}
