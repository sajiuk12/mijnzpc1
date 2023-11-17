//@dart=2.9
class Mjoinclient {

  int id;
  String user_id;
  String  	client_id ;
  String  	payrate ;
  String  	created_at ;
  String  	updated_at ;
  String registeras ;
  String  	client_payrate ;
  String  	department_id ;
  String  	employee_first_name 	;
  String employee_last_name ;
  String client_first_name ;
  String client_last_name;
  String department_title ;
  String company_name;

  //num price;


  Mjoinclient.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    user_id = parsedJson['user_id'];
    client_id  = parsedJson[' 	client_id '];
    payrate  = parsedJson[' 	payrate '];
    created_at  = parsedJson[' 	created_at '];
    updated_at  = parsedJson[' 	updated_at '];
    registeras  = parsedJson['registeras '];
    client_payrate  = parsedJson[' 	client_payrate '];
    department_id  = parsedJson[' 	department_id '];
    employee_first_name 	= parsedJson[' 	employee_first_name 	'];
    employee_last_name  = parsedJson['employee_last_name '];
    client_first_name  = parsedJson['client_first_name '];
    client_last_name = parsedJson['client_last_name'];
    department_title  = parsedJson['department_title '];
    company_name= parsedJson['company_name'];
  }
}
