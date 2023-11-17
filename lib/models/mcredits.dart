//@dart=2.9
class Mcredits {

  int id;
  String  	times_id ;
  String created_at ;
  String updated_at 	;
  String  	sendcout 	;

  //num price;


  Mcredits.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    times_id  = parsedJson[' 	times_id '];
    created_at  = parsedJson['created_at '];
    updated_at 	 = parsedJson['updated_at 	'];
    sendcout 	 = parsedJson[' 	sendcout 	'];
  }
}
