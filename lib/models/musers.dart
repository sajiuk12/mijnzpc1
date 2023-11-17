//@dart=2.9
class Musers {

  int id;
  String first_name;
  String last_name;
  String company_name;
  String user_type;
  String email;
  String email_verified_at;
  String password;
  String two_factor_secret;
  String two_factor_recovery_codes;
  int is_activated;
  int is_blocked;
  int client_id;
  String remember_token;
  String created_at;
  String updated_at;
  String leftside;
  String email_verify_code;
  String email_verify_time;
  String email_verified;
  String paginationnum;
  String datalayout;
  String datatopbar;
  String datasidebar;
  String datasidebarsize;
  String datalayoutmode;
  String datalayoutwidth;
  String datalayoutposition;
  String datalayoutstyle;
  String caninsertassignment;
  String token;
  String alertseen;
  String documentverified;
  String maindocumentverified;



  //num price;


  Musers.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    first_name = parsedJson['first_name'];
    last_name = parsedJson['last_name'];
    company_name = parsedJson['company_name'];
    user_type = parsedJson['user_type'];
    email  = parsedJson['email'];
    email_verified_at  = parsedJson['email_verified_at'];
    password = parsedJson['password'];
    two_factor_secret  = parsedJson['two_factor_secret'];
    two_factor_recovery_codes = parsedJson['two_factor_recovery_codes'];
    is_activated = parsedJson['is_activated'];
    is_blocked  = parsedJson['is_blocked'];
    client_id  = parsedJson['client_id'];
    remember_token = parsedJson['remember_token'];
    created_at  = parsedJson['created_at'];
    updated_at  = parsedJson['updated_at'];
    leftside = parsedJson['leftside'];
    email_verify_code  = parsedJson['email_verify_code'];
    email_verify_time  = parsedJson['email_verify_time'];
    email_verified = parsedJson['email_verified'];
    paginationnum  = parsedJson['paginationnum'];
    datalayout = parsedJson['datalayout'];
    datatopbar  = parsedJson['datatopbar'];
    datasidebar  = parsedJson['datasidebar'];
    datasidebarsize  = parsedJson['datasidebarsize'];
    datalayoutmode  = parsedJson['datalayoutmode'];
    datalayoutwidth  = parsedJson['datalayoutwidth'];
    datalayoutposition = parsedJson['datalayoutposition'];
    datalayoutstyle  = parsedJson['datalayoutstyle'];
    caninsertassignment  = parsedJson['caninsertassignment'];
    token  = parsedJson['token'];
    alertseen = parsedJson['alertseen'];
    documentverified  = parsedJson['documentverified'];
    maindocumentverified  = parsedJson[' 	maindocumentverified'];
  }
}
