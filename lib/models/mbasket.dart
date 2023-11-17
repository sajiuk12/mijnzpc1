//@dart=2.9
class Mbasket {
  int id;
  int product_id;
  String product_name;
  String product_pic;
  int qty;
  String future;
  num price;
  int factor_id;
  int f1;
  int f2;
  int f3;
  int f4;
  int f5;
  int f6;
  int f7;
  int f8;
  int f9;
  int f10;

  Mbasket.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    product_id = parsedJson['product_id'];
    product_name = parsedJson['product_name'];
    product_pic = parsedJson['product_pic'];
    qty = parsedJson['qty'];
    future = parsedJson['future'];
    price = parsedJson['price'];
    factor_id = parsedJson['factor_id'];
    f1 = parsedJson['f1'];
    f2 = parsedJson['f2'];
    f3 = parsedJson['f3'];
    f4 = parsedJson['f4'];
    f5 = parsedJson['f5'];
    f6 = parsedJson['f6'];
    f7 = parsedJson['f7'];
    f8 = parsedJson['f8'];
    f9 = parsedJson['f9'];
    f10 = parsedJson['f10'];

  }
}
