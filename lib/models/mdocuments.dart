//@dart=2.9
class Mdocuments {

  int id;
  String title;
  String  	created_at ;
  String  	updated_at 	;


  //num price;


  Mdocuments.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    title = parsedJson['title'];
    created_at  = parsedJson[' 	created_at '];
    updated_at 	 = parsedJson[' 	updated_at 	'];
  }
}
