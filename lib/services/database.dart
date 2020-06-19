import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  final CollectionReference menu = Firestore.instance.collection('food');

  Future updateuserdata(String sugars, String name , int Strength) async {
    return await menu.document(uid).setData({
      'sugars':sugars,
      'name':name,
      'Strength': Strength,
    });
  }

  Stream<QuerySnapshot> get food {
    return menu.snapshots();
  }
}