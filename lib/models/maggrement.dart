//@dart=2.9
class Maggrement {

  int id;
  String title;
  String  	clientbox;
  String  	text1;
  String  	type;
  String btwplicht;
  String  	ort;
  String  	extratitle1;
  String  	extratext1;
  String  	extratitle2;
  String extratext2;
  String  	extratitle3;
  String  	extratext3;
  String  	extratitle4;
  String extratext4;
  String extratitle5;
  String extratext5;
  String extratitle6;
  String  extratext6;
  String  	text2;
  String  	pic;
  String  	clientsignbox;
  String created_at;
  String updated_at;
  int  	client_id;
  String  	registeras;
  String  	company_name;

  //num price;


  Maggrement.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    title = parsedJson['title'];
    clientbox  = parsedJson['clientbox'];
    text1 = parsedJson['text1'];
    type  = parsedJson['type'];
    btwplicht = parsedJson['btwplicht'];
    ort  = parsedJson['ort'];
    extratitle1 = parsedJson['extratitle1'];
    extratext1  = parsedJson['extratext1'];
    extratitle2  = parsedJson['extratitle2'];
    extratext2  = parsedJson['extratext2'];
    extratitle3  = parsedJson['extratitle3'];
    extratext3  = parsedJson['extratext3'];
    extratitle4  = parsedJson['extratitle4'];
    extratext4  = parsedJson['extratext4'];
    extratitle5 = parsedJson['extratitle5'];
    extratext5  = parsedJson['extratext5'];
    extratitle6 = parsedJson['extratitle6'];
    extratext6  = parsedJson['extratext6'];
    text2  = parsedJson['text2'];
    pic  = parsedJson['pic'];
    clientsignbox = parsedJson['clientsignbox'];
    created_at  = parsedJson['created_at'];
    updated_at  = parsedJson['updated_at'];
    client_id  = parsedJson['client_id'];
    registeras = parsedJson['registeras'];
    company_name = parsedJson['company_name'];
  }
}
