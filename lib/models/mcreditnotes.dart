//@dart=2.9
class Mcreditnotes {

  int id;
  String  	time_from ;
  String  	time_to ;
  String start_date ;
  String  	end_date ;
  String sleepshift ;
  String  	assignments_id  ;
  String 	breake ;
  String admin_id  ;
  String created_at  ;
  String 	updated_at  ;
  String 	archive  ;
  String 	times_id   ;
  String 	credits_id   ;


  //num price;


  Mcreditnotes.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    time_from  = parsedJson[' 	time_from '];
    time_to  = parsedJson[' 	time_to '];
    start_date  = parsedJson['start_date '];
    end_date  = parsedJson[' 	end_date '];
    sleepshift  = parsedJson['sleepshift '];
    assignments_id  = parsedJson['assignments_id '];
    breake = parsedJson['break'];
    admin_id  = parsedJson['admin_id '];
    created_at  = parsedJson['created_at '];
    updated_at  = parsedJson['updated_at '];
    archive  = parsedJson['archive '];
    times_id  = parsedJson['times_id '];
    credits_id  = parsedJson['credits_id '];
  }
}
