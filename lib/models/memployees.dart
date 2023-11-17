//@dart=2.9
class Memployees {

  int id;
  String first_name;
  String last_name;
  String company_name;
  String user_type;
  String email ;
  int is_activated ;
  String registeras ;
  String registeras1 ;
  String profile_url ;
  int    user_id ;


  Memployees.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    first_name = parsedJson['first_name'];
    last_name = parsedJson['last_name'];
    company_name = parsedJson['company_name'];
    user_type = parsedJson['user_type'];
    email  = parsedJson['email'];
    is_activated = parsedJson['is_activated'];
    registeras = parsedJson['registeras'];
    registeras1 = parsedJson['registeras1'];
    profile_url = parsedJson['profile_url'];
    user_id = parsedJson['user_id'];

  }
}
