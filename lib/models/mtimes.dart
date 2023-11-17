//@dart=2.9
class Mtimes {
  int id;
  String status;
  String registeras;
  int client_id ;
  int department_id ;
  int employee_id  ;
  String year;
  String month;
  String day;
  String comment;
  String invoicenumber;
  String type;
  String created_at;
  String updated_at;
  String clientfirstname;
  String clientlastname;
  String title;
  String emfirstname;
  String emlastname;
  String company_name;
  String totalpayrate;
  String totalclientpayrate;
  String total;
  String temptotalpayrate;
  String temptotalclientpayrate;
  String temptotal;

  Mtimes.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    status = parsedJson['status'];
    registeras = parsedJson['registeras'];
    client_id  = parsedJson['client_id'];
    department_id = parsedJson['department_id'];
    employee_id  = parsedJson['employee_id'];
    year = parsedJson['year'];
    month = parsedJson['month'];
    day = parsedJson['day'];
    invoicenumber = parsedJson['invoicenumber'];
    type = parsedJson['type'];
    created_at = parsedJson['created_at'];
    updated_at = parsedJson['updated_at'];
    clientfirstname= parsedJson['clientfirstname'];
    clientlastname= parsedJson['clientlastname'];
    title= parsedJson['title'];
    emfirstname= parsedJson['emfirstname'];
    emlastname= parsedJson['emlastname'];
    company_name= parsedJson['company_name'];
    totalclientpayrate= parsedJson['totalclientpayrate'];
    totalpayrate= parsedJson['totalpayrate'];
    total= parsedJson['total'];
    temptotalpayrate= parsedJson['temptotalpayrate'];
    temptotalclientpayrate= parsedJson['temptotalclientpayrate'];
    temptotal= parsedJson['temptotal'];
  }
}
