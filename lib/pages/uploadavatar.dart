//@dart=2.9
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/my_home_page.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:mijnzpc/all_translations.dart';
class Uploadavatar extends StatefulWidget{

  Uploadavatar(
      {@required this.backgroundcolor,this.gradiantcolor,
        this.color,this.bottomcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor
      });
  Color backgroundcolor;
  Color color;
  Color bottomcolor;
  Color cardcolor;
  Color shadowcolor;
  Color appbarcolor;
  Color titlecolor;
  Color textcolor;
  Color bottombarcolor;
  Color gradiantcolor;

  @override
  State<StatefulWidget> createState() {
    return _Uploadavatar();
  }
}

class _Uploadavatar extends State<Uploadavatar>{

  File selectedfile;
  Response response;
  String progress;
  Dio dio = new Dio();

  String date;
  String result="";
  String document_id;
  String _path ;
  bool _pickFileInProgress = false;
  bool _iosPublicDataUTI = true;
  bool _checkByCustomExtension = false;
  bool _checkByMimeType = false;
  bool _isMultipleSelection = false;

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
    {"name": "Resume" , "id": 1},
    {"name": "Chamber of Commerce KVK" , "id": 2},
    {"name": "Diploma" , "id": 3},
    {"name": "Insurace" , "id": 4},
    {"name": "Klachtenportaal  (WKKGZ)" , "id": 5},
    {"name": "Copy ID Front & Back" , "id": 6},
    {"name": "Verklaring Omtrent het Gedrag  (VOG)" , "id": 7},
    {"name": "Certificates" , "id": 8},
    {"name": "Copy other documents" , "id": 9},
    {"name": "Company Logo" , "id": 11},
    {"name": "BTW Identification number" , "id": 12},
    {"name": "Assurance Statement" , "id": 13},
    {"name": "Reference" , "id": 14},
    {"name": "BIG registratie of AGB Code" , "id": 16},
    {"name": "riskscan" , "id": 18},

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          toolbarHeight: 40,
          iconTheme: IconThemeData(
            color: widget.titlecolor, //change your color here
          ),
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Text(allTranslations.text('Upload avatar'),style: TextStyle(color: Colors.grey),),),
          backgroundColor: widget.bottombarcolor,

        ),
        backgroundColor: widget.backgroundcolor,




        body:Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(0),
            child:Column(children: <Widget>[

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child:Column(children: <Widget>[




                  Padding(
                    padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 5),
                    child:     Container(
                      // width: MediaQuery.of(context).size.width,
                       // height: 70.0,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child:   Padding(
                        padding: EdgeInsets.only(top:16,left: 10,right:0,bottom: 16),
                        child:Align(
                          alignment: Alignment.centerLeft,
                          child:RichText(
                            text: TextSpan(
                              children: [

                                WidgetSpan(
                                  child: Icon(Icons.folder_open,color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: getpath(),style: TextStyle(color: Colors.grey[500],fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ),


                  ),


                  // Container(
                  //   margin: EdgeInsets.all(10),
                  //
                  //   //show file name here
                  //   child:selectedfile == null?
                  //   Text("Choose File"):
                  //   Text(basename(selectedfile.path)),
                  //   //basename is from path package, to get filename from path
                  //   //check if file is selected, if yes then show file name
                  // ),


                  Container(
                      child:RaisedButton.icon(

                        onPressed: (){
                          _pickDocument();
                        },
                        icon: Icon(Icons.folder_open),
                        label: Text(allTranslations.text("CHOOSE FILE")),
                        color: widget.color,
                        colorBrightness: Brightness.dark,
                      )
                  ),


                  Container(
                      child:  Text(allTranslations.text(result)),
                  ),





                ],
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
                                widget.gradiantcolor,
                                widget.color,

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
                            uploadFile();
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

    String uploadurl = "https://mijnzpc.com/api/v1/uploadavatar?token="+token+'&id=';

    FormData formdata = FormData.fromMap({
      "image": await MultipartFile.fromFile(
          _path,
          filename: basename(_path)
        //show only filename from path
      ),
      "document_id": 0,
      "expire_date": 0,
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
      print(response.toString());

      var responseBody = json.decode(response.toString());


          setState(() {
            result=responseBody['msg'].toString();
          });

      navigationToHome();


      //print response from server
    }else{
      print("Error during connection to server.");
    }



  }

  navigationToHome() {

      Navigator.push(this.context, new MaterialPageRoute(builder: (context) => new MyHomePages(
          backgroundcolor: widget.backgroundcolor,
          color: widget.color,
          gradiantcolor:widget.gradiantcolor,
          cardcolor:widget.cardcolor,
          shadowcolor:widget.shadowcolor,
          appbarcolor:widget.appbarcolor,
          titlecolor:widget.titlecolor,
          textcolor:widget.textcolor,
          bottombarcolor:widget.bottombarcolor
      )));


  }




  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color:Colors.grey,
          width: 1,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color:Colors.grey,
          width: 1,
        )
    );
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



}