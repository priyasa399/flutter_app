import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/crud.dart';

class dropit extends StatefulWidget {
  dropit() : super();

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
class DropDownState extends State<dropit> {
  //
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  String name,url,quantity,type,category,cost;
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
    });
  }
  crudMethods crudObj=new crudMethods();

  @override
  Future<bool>dialogTrigger(BuildContext context)async{
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
                  if (name != null) {
                    Navigator.of(context).pop();
                    Map<String, String> itemData = {
                      'category': this.category,
                      'item_url': this.url,
                      'quantity_type': this.type
                    };


                    Map<String, String>retItem = {
                      'item_url': this.url,
                      'quantity': this.quantity,
                      'quantity_type': this.type,
                      'retailer_id': 'abc',
                      'retailer_name': 'hello',
                      'cost':this.cost,
                      'item_name':this.name
                    };
                    crudObj.addData(itemData , Category).
                    then((result) {
                      dialogTrigger(context);
                    }).
                    catchError((e) {
                      print(e);
                    });
                  }
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