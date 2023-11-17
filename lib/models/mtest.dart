//@dart=2.9
class User {


  int id;
  String company_name;




  User.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    company_name = parsedJson['company_name'];




  }
}
