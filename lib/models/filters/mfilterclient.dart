//@dart=2.9
class Mfilterclient {

  int client_id;
  String first_name;
  String last_name;
  String company_name;
  //num price;



  Mfilterclient.fromJson(Map<String , dynamic> parsedJson)
  {
    first_name = parsedJson['first_name'];
    last_name = parsedJson['last_name'];
    company_name = parsedJson['company_name'];
    client_id = parsedJson['id'];


  }
}
