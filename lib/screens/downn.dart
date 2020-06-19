import 'package:flutter/material.dart';
import 'package:flutterapp/crud.dart';
import 'package:flutterapp/main.dart';

class DropDown extends StatefulWidget {
  DropDown() : super();

  final String title = "DropDown Demo";

  @override
  DropDownState createState() => DropDownState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Rice'),
      Company(2, 'Juice'),
      Company(3, 'Faluda'),
      Company(4, 'Chapati'),
      Company(5, 'Gravy'),
    ];
  }

}

class DropDownState extends State<DropDown> {
  //
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  String Category;


  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
      Category = _selectedCompany.name;
    });
  }
  Example mainObj=new Example();
  crudMethods crudObj=new crudMethods();

  @override
  Future<bool>dialogTrigger(BuildContext context)async{
    List<String> data = ModalRoute.of(context).settings.arguments;
    var url = data[0];
    var name=data[1];
    var price=data[2];

    print("vyshunaviiiiiiiiiiiiiiii");
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder:(BuildContext context){
          return AlertDialog(
            title: Text('job done'),
            content: Text('added'),
            actions: <Widget>[
              FlatButton(
                child: Text('alright'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: new AppBar(
          title: new Text("Select category"
              ),
          backgroundColor: Colors.green[400],
        ),
        body: new Container(
          padding: EdgeInsets.all(100.0),
            child: Column(
              children: <Widget>[
                Text("Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedCompany,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Selected: ${_selectedCompany.name}'),
                FlatButton(
                  onPressed: () {
                    List<String> data = ModalRoute.of(context).settings.arguments;
                    var url = data[0];
                    var name=data[1];
                    var price=data[2];
                        Navigator.of(context).pop();
                        Map<String, String> itemData = {
                          'item_name': name,
                          'item_url': url,
                          'price': price,

                        };

                        crudObj.addData(itemData, this.Category).
                        then((result) {
                          dialogTrigger(context);
                        }).
                        catchError((e) {
                          print(e);
                        });
                    },
                      color: Colors.pink[800],
                      child: Text('Confirm',
                      style: TextStyle(
                      color: Colors.white,
                    ),),
                )
              ],
            ),
        ),
      ),
    );
  }
}