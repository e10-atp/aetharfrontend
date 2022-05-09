import 'package:aethar/model/userpath.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'model/userpath.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference userpaths = FirebaseFirestore.instance.collection('userpaths');

  Future updateUserData(String path) async {
    //sets data
    return await userpaths.doc(uid).collection('history').add({
      'page': path,
      'time': DateFormat.yMd().add_jms().format(DateTime.now()),
    }).then((value) => print("Data Set"))
        .catchError((error) => print("Failed to add Path: $error"));
  }

  List<userpath> _pathListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      print(doc.data());
      return userpath(
          page: doc['page'] ?? '',
          time: doc['time'] ?? '',
      );
    }).toList();
  }

  Future updateFriendList(String name) async {
    //sets data
    return await userpaths.doc(uid).collection('friends').add({
      'user': name,
    }).then((value) => print("Data Set"))
        .catchError((error) => print("Failed to add Path: $error"));
  }


  Future friendListFromSnapshot() async {
    var snapshot = await userpaths.doc(uid).collection('friends').get();
    return snapshot.docs.map((doc){
      return doc['user'] as String;
    }).toList();
  }

  Stream<List<userpath>> get paths {
    return userpaths.doc(uid).collection('history').orderBy('time', descending: true).snapshots().map(_pathListfromSnapshot);
  }
}