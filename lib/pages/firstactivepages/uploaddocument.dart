//@dart=2.9
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mijnzpc/pages/firstactivepages/managedocument.dart';
import 'package:path/path.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/pages/dashboard/invoices/managedocuments.dart';
import 'dart:convert';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:mijnzpc/pages/selecters/selectdocuments.dart';import 'package:http/http.dart' as http;
class Uploadfirstactive extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    return _Uploadfirstactive();
  }
}

class _Uploadfirstactive extends State<Uploadfirstactive>{
  TextEditingController date1 = TextEditingController();
  File selectedfile;
  Response response;
  String progress;
  Dio dio = new Dio();
  String result="";
  String date;
  String document_id;
  String _path ;
  bool _pickFileInProgress = false;
  bool _iosPublicDataUTI = true;
  bool _checkByCustomExtension = false;
  bool _checkByMimeType = false;
  bool _isMultipleSelection = false;
  String document_name="Document";
  final _utiController = TextEditingController(
    text: 'com.sidlatau.example.mwfbak',
  );

  final _extensionController = TextEditingController(
    text: 'mwfbak',
  );

  final _mimeTypeController = TextEditingController(
    text: 'application/pdf image/png',
  );

  selectFile() async {
    // selectedfile = await FilePicker.getFile(
    //   type: FileType.custom,
    //   allowedExtensions: ['jpg', 'pdf', 'mp4'],
    //   //allowed extension to choose
    // );
    //
    // setState((){}); //update the UI so that file name is shown
  }
  String birthdate;
  final List<Map<String, dynamic>> _roles = [
    {"name": allTranslations.text("Resume") , "id": 1},
    {"name": allTranslations.text("Chamber of Commerce KVK") , "id": 2},
    {"name": allTranslations.text("Diploma") , "id": 3},
    {"name": allTranslations.text("Insurace") , "id": 4},
    {"name": allTranslations.text("Klachtenportaal  (WKKGZ)") , "id": 5},
    {"name": allTranslations.text("Copy ID Front & Back") , "id": 6},
    {"name": allTranslations.text("Verklaring Omtrent het Gedrag  (VOG)") , "id": 7},
    {"name": allTranslations.text("Certificates") , "id": 8},
    {"name": allTranslations.text("Copy other documents") , "id": 9},
    {"name": allTranslations.text("Company Logo") , "id": 10},
    {"name": allTranslations.text("BTW Identification number") , "id": 11},
    {"name": allTranslations.text("Assurance Statement") , "id": 12},
    {"name": allTranslations.text("Reference") , "id": 13},
    {"name": allTranslations.text("BIG registratie of AGB Code") , "id": 14},
    {"name": allTranslations.text("riskscan") , "id": 15},
    {"name": allTranslations.text("Proof of payment prof. liability insurance") , "id": 16},
    {"name": allTranslations.text("Proof of payment complaints procedure") , "id": 17},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: new AppBar(
          toolbarHeight: 40,
          iconTheme: IconThemeData(
            color: Colors.grey[700], //change your color here
          ),
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Text(allTranslations.text('Upload document: '),style: TextStyle(color: Colors.grey),),),
          backgroundColor: Colors.white,

        ),
        backgroundColor: Colors.white,

        bottomSheet:Container(
          decoration:   BoxDecoration(
            color:Colors.white,
          ),
          child:

          new  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[





                Expanded(
                  flex: 10,
                  child:  Padding(
                    padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                    child:  SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        child:  DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xff313F1A),
                                      Color(0xff89B44B),

                                      //add more colors
                                    ]),
                                borderRadius: BorderRadius.circular(0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0.0, 3.75),
                                      color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]
                            ),
                            child:ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onSurface: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  //make color or elevated button transparent
                                ),

                                onPressed: (){
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Managedocumentfirstactive()));
                                },
                                child: Padding(
                                  padding:EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child:Center(
                                    child: Text(allTranslations.text('Documents') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                                  ),
                                )
                            )
                        )

                    ),


                  ),
                ),









              ]
          ),
        ),
        body:Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(0),
            child:Column(children: <Widget>[

              Padding(
                padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // color: widget.backgroundcolor,
                    borderRadius: BorderRadius.circular(0.0),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 3.75),
                          color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                          blurRadius: 5
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                    child: InkWell(
                      onTap: () {
                        _getfilteredocument(context);
                      },
                      child: new Text(
                        allTranslations.text(document_name),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color:   Colors.grey[500],
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  //jobtitle
                ),
              ),




              Padding(
                padding: EdgeInsets.only(top:10,left: 2,right: 0,bottom: 10),
                child:     Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 140.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0.0),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 3.75),
                          color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                          blurRadius: 5
                      )
                    ],
                  ),
                  child:  Padding(
                    padding: EdgeInsets.only(top:0,left: 0,right: 15,bottom: 0),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 0),
                            child:     Container(
                              width: MediaQuery.of(context).size.width,
                              // height: 140.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0),

                              ),
                              child: TextField(
                                style: TextStyle(color: Colors.grey[500]),
                                controller: date1, //editing controller of this TextField
                                decoration: InputDecoration(
                                  border: myinputborder(),
                                  enabledBorder: myinputborder(),
                                  focusedBorder: myfocusborder(),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  labelText: allTranslations.text("Experation Date"),
                                  labelStyle: TextStyle(
                                    color: Colors.grey[500], //<-- SEE HERE
                                  ),
                                ),
                                readOnly: true,  //set it true, so that user will not able to edit text
                                onTap: () async {
                                  selectDate(context,1);
                                },
                              ),
                            ),
                          ),
                        ],
                      ), //Column
                    ), //SizedBox
                  ), //Padding


                ),


              ),





              Padding(
                padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                child:
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 140.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0.0),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 3.75),
                          color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                          blurRadius: 5
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top:15,left: 0,right: 15,bottom: 5),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top:0,left: 5,right:0,bottom: 16),
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child:RichText(
                                text: TextSpan(
                                  children: [

                                    TextSpan(
                                      text: getpath(),style: TextStyle(color: Colors.grey,fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), //Column
                    ), //SizedBox
                  ), //Padding


                ),
              ),



              Padding(
                padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                child:
                Container(
                    child:RaisedButton.icon(

                      onPressed: (){
                        _pickDocument();
                      },
                      icon: Icon(Icons.folder_open),
                      label: Text(allTranslations.text("CHOOSE FILE")),
                      color: Color(0xff89B44B),
                      colorBrightness: Brightness.dark,
                    )
                ),
              ),




              _path == null?
              Container():
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child:  DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xff313F1A),
                                Color(0xff89B44B),
                                //add more colors
                              ]),
                          borderRadius: BorderRadius.circular(0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                offset: Offset(0.0, 3.75),
                                color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]
                      ),
                      child:ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            onSurface: Colors.transparent,
                            shadowColor: Colors.transparent,
                            //make color or elevated button transparent
                          ),

                          onPressed: (){
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return new Container(
                                      child: new Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: new AlertDialog(
                                            title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                                            content: new Text(allTranslations.text('You are about to upload a document. Proceed?'),style: TextStyle(color: Colors.grey)),
                                            actions: <Widget>[
                                              new FlatButton(
                                                  onPressed: () => Navigator.of(context).pop(false),
                                                  child: new Text(allTranslations.text('No') , style: TextStyle(color: Colors.red),)
                                              ),
                                              new FlatButton(
                                                  onPressed: () {

                                                    uploadFile();
                                                    Navigator.pop(context);
                                                  },
                                                  child: new Text(allTranslations.text('Yes') , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),)
                                              ),
                                            ],
                                          )
                                      )
                                  );
                                }
                            ) ?? false;


                          },
                          child: Padding(
                            padding:EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            child:Center(
                              child: Text(allTranslations.text('Confirm') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                            ),
                          )
                      )
                  )

              ),


            ],)
        )
    );
  }

  getpath()
  {

    if(_path == null){
      return allTranslations.text("  Selected File");
    }else{
      return basename(_path);
    }
  }
  uploadFile() async {
    print('dsdsdsdsds');
    print(_path);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');

    String uploadurl = "https://mijnzpc.com/api/v1/uploaddocument?token="+token;

    FormData formdata = FormData.fromMap({
      "image": await MultipartFile.fromFile(
          _path,
          filename: basename(_path)
        //show only filename from path
      ),
      "document_id": document_id,
      "expire_date": date1.text,
    });

    response = await dio.post(uploadurl,
      data: formdata,
      onSendProgress: (int sent, int total) {
        String percentage = (sent/total*100).toStringAsFixed(2);
        setState(() {
          progress = "$sent" + " Bytes of " "$total Bytes - " +  percentage + " % uploaded";
          //update the progress
        });
      },);

    if(response.statusCode == 200){
      var responseBody = json.decode(response.toString());

      return showDialog(
          context: this.context,
          builder: (context) {
            return new Directionality(
                textDirection: TextDirection.ltr,
                child: new AlertDialog(
                  backgroundColor: Colors.white,
                  title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                  content: new Text(allTranslations.text(responseBody['msg'].toString()),style: TextStyle(color: Colors.grey)),
                  actions: <Widget>[

                    new FlatButton(
                        onPressed: () {
                          // exit(0);
                          Navigator.of(context).pop();
                        },
                        child: new Text(allTranslations.text('Ok'), style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),)
                    ),
                  ],
                )
            );
          }
      ) ?? false;



      setState(() {
        result=responseBody['msg'].toString();
      });
    }else{
      print("Error during connection to server.");
    }
  }

  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color:Colors.white,
          width: 1,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color:Colors.white,
          width: 0,
        )
    );
  }


  Future<Null> selectDate(BuildContext context,int variable) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {

        if(Colors.white==Color(0xff1a1d21)){
          return  Theme(
            data: ThemeData.dark().copyWith(
                colorScheme:   ColorScheme.light(
                  onPrimary: Colors.grey[500], // selected text color
                  onSurface: Colors.grey[500], // default text color
                  primary: Color(0xff89B44B),// circle color
                ),
                dialogBackgroundColor: Colors.white,
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        textStyle:   TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: 'Quicksand'),
                        primary: Colors.grey[500], // color of button's letters
                        backgroundColor: Colors.transparent, // Background color
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50))))),
            child: child,
          );
        }
        else
        {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xff89B44B), // header background color
                onPrimary: Colors.black, // header text color
                onSurface: Colors.grey[700], // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.grey, // button text color
                ),
              ),
            ),
            child: child,
          );
        }




      },
    );


    if(variable==1){
      setState(() {
        date1.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }


  }


  _pickDocument() async {
    String result;
    try {
      setState(() {
        _path;
        _pickFileInProgress = true;
      });

      FlutterDocumentPickerParams params = FlutterDocumentPickerParams(
        allowedFileExtensions: _checkByCustomExtension
            ? _extensionController.text
            .split(' ')
            .where((x) => x.isNotEmpty)
            .toList()
            : null,
        allowedUtiTypes: _iosPublicDataUTI
            ? null
            : _utiController.text
            .split(' ')
            .where((x) => x.isNotEmpty)
            .toList(),
        allowedMimeTypes: _checkByMimeType
            ? _mimeTypeController.text
            .split(' ')
            .where((x) => x.isNotEmpty)
            .toList()
            : null,
      );
      if (_isMultipleSelection) {
        final list = await FlutterDocumentPicker.openDocuments(params: params);
        result = list?.where((x) => x != null).join('\n');
      } else {
        result = await FlutterDocumentPicker.openDocument(params: params);
      }
    } catch (e) {
      print(e);
      result = 'Error: $e';
    } finally {
      setState(() {
        _pickFileInProgress = false;
      });
    }

    setState(() {
      _path = result;
    });
  }

  void _getfilteredocument(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Selectdocument(
          idfromfirstpage:document_id.toString(),
        )));
    setState(() {
      if(result!=null)
      {
        document_id = result ;
      }
      else
      {
        // employee_id1=-1;
        // employeename1="All";
      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/filterdocumentinfo?token='+token+'&id='+document_id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['document'].toList().length > 0)
      {
        print(responseBody['document'][0]['title']);
        setState(() {
          document_name= responseBody['document'][0]['title'].toString();
        });
      }
    }
  }

}