import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_service.dart';

class FirestoreService {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveVehicle({
    required String make,
    required String model,
    required String year,
  }) async {

    final user = AuthService().currentUser;

    if (user == null) return;

    await _db.collection("vehicles").doc(user.uid).set({
      "make": make,
      "model": model,
      "year": year,
      "updatedAt": Timestamp.now(),
    });
  }

  Future<Map<String, dynamic>?> getVehicle() async {

    final user = AuthService().currentUser;
    if (user == null) return null;

    final doc = await _db.collection("vehicles").doc(user.uid).get();

    return doc.data();
  }
}
Stream<QuerySnapshot> getOrders() {

  final user = AuthService().currentUser;
  return _db
      .collection("orders")
      .where("userId", isEqualTo: user?.uid)
      .snapshots();
}

Future<void> addOrder(String partName) async {

  final user = AuthService().currentUser;

  if (user == null) return;

  await _db.collection("orders").add({
    "partName": partName,
    "userId": user.uid,
    "createdAt": Timestamp.now(),
  });
}

Future<void> deleteOrder(String id) async {
  await _db.collection("orders").doc(id).delete();
}
