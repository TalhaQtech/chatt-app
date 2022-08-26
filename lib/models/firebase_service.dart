import 'package:cloud_firestore/cloud_firestore.dart';

firestore_set(collection, doc, set) async {
  await FirebaseFirestore.instance
      .collection(collection.toString())
      .doc(doc.toString())
      .set(set);
}

firestore_get(collection, doc) async {
  DocumentSnapshot userData =
      await FirebaseFirestore.instance.collection(collection).doc(doc).get();
  return userData;
}
