import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {

  static Map<String, String> userInfo = {};
  final _firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  DatabaseService() {
    print("DatabaseService Initialized");
  }

  Future getCurrentUserData(String email) async {
    final querySnapshot = await _firestore
        .collection('registration')
        .where('email', isEqualTo: email)
        .get();
    for (var doc in querySnapshot.docs) {
      userInfo['firstName'] = getOrElseValue(doc, 'firstname');
      userInfo['lastName'] = getOrElseValue(doc, 'lastname');
      userInfo['email'] = getOrElseValue(doc, 'email');
      userInfo['age'] = getOrElseValue(doc, 'age');
      userInfo['height'] = getOrElseValue(doc, 'height');
      userInfo['weight'] = getOrElseValue(doc, 'weight');
      userInfo['gender'] = getOrElseValue(doc, 'gender');
    }
  }

  String getUserValue(String field)
  {
    try {
      return userInfo[field].toString();
    } catch(e) {
      print("[DatabaseService]: Data from field $field is not present!");
      return '';
    }
  }

  Future setValueInDatabase(String field, String value) async {
    userInfo[field] = value;
    var querySnapshot = await _firestore
        .collection('registration')
        .where('email', isEqualTo: userInfo['email']).get();

    for (var doc in querySnapshot.docs) {
      doc.reference.update({field: value});
    }

  }

  String getOrElseValue(QueryDocumentSnapshot doc, String field) {
    try {
      return doc.get(field);
    } catch(e) {
      print("[DatabaseService] Field $field threw the following error: " + e.toString());
      return '';
    }
  }

  static String getLoggedUserName() {
     if(userInfo.containsKey('firstName')) {
       return userInfo['firstName'].toString();
     } else {
       return '';
     }
  }



}