//@dart=2.9
class Mdepartments {

  int id;
  String title;
  String cost;
  String  	education_title;
  String  	description;
  String  	requirements;
  String  	conditions;
  int is_available;
  int  	is_public;
  int  	driving_licence;
  int client_id;
  int  	admin_id;
  String created_at;
  String  	updated_at;
  String  	phone;
  String department_id;
  String company_name;


  //num price;


  Mdepartments.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    title = parsedJson['title'];
    cost  = parsedJson['cost'];
    education_title = parsedJson['education_title'];
    description = parsedJson['description'];
    requirements  = parsedJson['requirements '];
    conditions  = parsedJson['conditions'];
    is_available = parsedJson['is_available'];
    is_public  = parsedJson['is_public'];
    driving_licence = parsedJson['driving_licence'];
    client_id  = parsedJson['client_id'];
    admin_id  = parsedJson['admin_id'];
    created_at  = parsedJson['created_at'];
    updated_at  = parsedJson['updated_at'];
    phone = parsedJson['phone'];
    department_id 	 = parsedJson['department_id'];
    company_name 	 = parsedJson['company_name'];
  }
}
