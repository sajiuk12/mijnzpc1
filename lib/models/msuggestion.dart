//@dart=2.9
class Msuggestion {

  int id;
  int assignments_id;
  int user_id;
  String first_name;
  String last_name;
  String company_name;
  String created_at;
  String updated_at;


  //num price;


  Msuggestion.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    assignments_id  = parsedJson['assignments_id'];
    user_id  = parsedJson['user_id'];
    created_at  = parsedJson['created_at'];
    updated_at  = parsedJson['updated_at'];
    first_name  = parsedJson['first_name'];
    last_name  = parsedJson['last_name'];
    company_name  = parsedJson['company_name'];
  }
}
