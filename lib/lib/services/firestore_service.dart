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
