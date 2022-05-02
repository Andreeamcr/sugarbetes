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
      userInfo['firstName'] = doc.get('firstname');
      userInfo['lastName'] = doc.get('lastname');
      userInfo['email'] = doc.get('email');
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