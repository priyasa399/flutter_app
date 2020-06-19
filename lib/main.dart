// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutterapp/screens/downn.dart';
import 'package:flutterapp/screens/deletedown.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) =>Example(),
    '/items':(context) =>DropDown(),
  },
));



class Example extends StatelessWidget {
  String url,name,price,category;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: new AppBar(
        title: Text('Add or Delete an item'),
        backgroundColor: Colors.green[400],
      ),
      body: Column(
        mainAxisAlignment :MainAxisAlignment.start,
        children: <Widget> [
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Enter the URL'
              ),
    onChanged: (value) {
      this.url = value;
    }),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Enter the item name'
              ),
                onChanged: (value) {
            this.name = value;
            }
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Item Price'
              ),
                onChanged: (value) {
                  this.price = value;
                }
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                print(name);
                print("helooooooooooooooooooooo");
                Navigator.pushNamed(
                    context, "/items", arguments: [url, name, price]);
                {
                  return DropDown();
                }
              },
              color : Colors.pink[800],
              child: Text('Add item',
              style: TextStyle(
                color: Colors.white,
                ),),
            ),
          ),
        Container(
        padding: EdgeInsets.all(20.0),
        child: TextFormField(
         decoration: InputDecoration(
          labelText: 'Enter the item name'
      ),
    ),
    ),
    Container(child: FlatButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return dropit();
        }));
      },
      color : Colors.pink[800],
      child: Text(
          'Delete item',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    ),
    ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, Pagetwo() ); {
            return Pagetwo();
          };
        },
        child: Text('-->'),
        backgroundColor: Colors.green[400],
      ),
    );
  }
}
class Pagetwo extends MaterialPageRoute<Null>{
  Pagetwo(): super(builder: (BuildContext ctx)


  {return Scaffold(
    backgroundColor: Colors.grey[400],
    appBar: AppBar(
      backgroundColor: Colors.green[400],
      elevation: 1.0,
      title: Text('Block/Unblock Table'),
    ),
    body: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(30.0),
          child: TextFormField(
            decoration: InputDecoration(
                labelText: 'Table number'
            ),
          ),
        ),
        Container(child: FlatButton(
          onPressed: () {},
          color : Colors.pink[800],
          child: Text(
            'Block/Unblock',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ),
      ],
    ),
  );
  });
}
