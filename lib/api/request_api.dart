import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vacation_app/models/vacation_request.dart';

class RequestApi {
  static Future<void> addRequest(VacationRequest request) async {
    await FirebaseFirestore.instance
        .collection('requests')
        .doc(request.id)
        .set(request.toJson());
  }

  static Future<void> updateRequest(VacationRequest request) async {
    await FirebaseFirestore.instance
        .collection('requests')
        .doc(request.id)
        .update(request.toJson());
  }

  static Future<List<VacationRequest>> getUserRequests(String user) async {
    final requests =
        await FirebaseFirestore.instance.collection('requests').get();
    return requests.docs
        .map((e) => VacationRequest.fromJson(e.data()))
        .where((r) => r.sentFromEmail == user || r.managerId == user)
        .toList();
  }
}
