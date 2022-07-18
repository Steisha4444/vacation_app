import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vacation_app/models/user.dart';

class UsersApi {
  static Future<void> addUser(User user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.email)
        .set(user.toJson());
  }

  static Future<User> getUser(String id) async {
    final users = await FirebaseFirestore.instance.collection('users').get();
    return users.docs
        .map((e) => User.fromJson(e.data()))
        .toList()
        .firstWhere((element) => element.email == id);
  }

  static Future<List<User>> getUsers() async {
    final users = await FirebaseFirestore.instance.collection('users').get();
    return users.docs.map((e) => User.fromJson(e.data())).toList();
  }
}
