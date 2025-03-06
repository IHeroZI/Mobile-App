import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of food
  final CollectionReference food =
      FirebaseFirestore.instance.collection('food');

  // CREATE: add a new food menu
  Future<void> addFood(String name, double price) {
    return food.add({
      'name': name,
      'price': price,
      'timestamp': Timestamp.now(),
    });
  }

  // READ: get food from database
  Stream<QuerySnapshot> getFoodStream() {
    final foodStream = food.orderBy('name', descending: false).snapshots();

    return foodStream;
  }

  // UPDATE: update food given a doc id
  Future<void> updateFood(String docID, String name, double price) {
    return food.doc(docID).update({
      'name': name,
      'price': price,
      'timestamp': Timestamp.now(),
    });
  }

  // DELETE: delete food given a doc id
  Future<void> deleteFood(String docID) {
    return food.doc(docID).delete();
  }
}