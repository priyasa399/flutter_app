import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';

class crudMethods{
  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser()!=null){
      return true;
    }
    else{
      return false;
    }
  }
Future<void> addData(item, Category) async {
  if (true) {
    Firestore.instance.collection(Category).add(item)
        .catchError((e) {
      print(e);
    });

  }
  else {
    print('you need to be logged in');
  }
}}