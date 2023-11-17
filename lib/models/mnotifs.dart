//@dart=2.9
class Mnotifications {


  int id;
  String user_id;
  String title;
  String description;
  String year;
  String month;
  String assignments_id;
  String invoice_id;
  String times_id;
  String agreement_id;
  String seen;
  String key;
  String value;
  String created_at;
  String updated_at;




  Mnotifications.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    user_id = parsedJson['user_id'];
    title = parsedJson['title'];
    description = parsedJson['description'];
    year = parsedJson['year'];
    month = parsedJson['month'];
    assignments_id = parsedJson['assignments_id'];
    invoice_id = parsedJson['invoice_id'];
    times_id = parsedJson['times_id'];
    agreement_id = parsedJson['agreement_id'];
    seen = parsedJson['seen'];
    key = parsedJson['key'];
    value = parsedJson['value'];
    created_at = parsedJson['created_at'];
    updated_at = parsedJson['updated_at'];




  }
}
