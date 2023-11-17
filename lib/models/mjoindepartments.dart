//@dart=2.9
class Mjoindepartments {

  int id;
  String  	user_id ;
  String  	client_id;
  String registeras ;
  String  	department_id;
  String  	created_at ;
  String  	 	updated_at  ;

  //num price;


  Mjoindepartments.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    user_id  = parsedJson[' 	user_id '];
    client_id = parsedJson[' 	client_id'];
    registeras  = parsedJson['registeras '];
    department_id = parsedJson['department_id'];
    created_at  = parsedJson['created_at '];
    updated_at   = parsedJson['updated_at  '];
  }
}
