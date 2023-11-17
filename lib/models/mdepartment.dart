//@dart=2.9
class Mdepartment {
  int id;
  String title;
  String cost;
  String education_title;
  String description;
  String requirements;
  String conditions;
  String is_available;
  String is_public;
  String driving_licence;
  String client_id;
  String admin_id;
  String phone;
  String department_id;


  Mdepartment.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    title = parsedJson['title'];
    cost = parsedJson['cost'];
    education_title = parsedJson['education_title'];
    description = parsedJson['description'];
    requirements = parsedJson['requirements'];
    conditions = parsedJson['conditions'];
    is_available = parsedJson['is_available'];
    is_public = parsedJson['is_public'];
    driving_licence = parsedJson['driving_licence'];
    client_id = parsedJson['client_id'];
    admin_id = parsedJson['admin_id'];
    phone = parsedJson['phone'];
    department_id = parsedJson['department_id'];



  }
}
