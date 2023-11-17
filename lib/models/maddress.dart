//@dart=2.9
class Maddress {


  String address_line2;
  String address_line1;
  String country;
  String city;
  String postcode;
  String street;
  String place_id;
  double lat;
  double lon;
  String housenumber;




  Maddress.fromJson(Map<String , dynamic> parsedJson)
  {
    address_line2 = parsedJson['address_line2'];
    address_line1 = parsedJson['address_line1'];
    country = parsedJson['country'];
    city = parsedJson['city'];
    postcode = parsedJson['postcode'];
    street = parsedJson['street'];
    place_id = parsedJson['place_id'];
    lat = parsedJson['lat'];
    lon = parsedJson['lon'];
    housenumber = parsedJson['housenumber'];




  }
}
