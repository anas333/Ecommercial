import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database_repo/src/model/shirt_model.dart';

class CloudFirestore {
  FirebaseFirestore? _instance;
  final List<Shirts> _shirts = [];

  Future<List<Shirts>> getShirts() async {
    _instance = FirebaseFirestore.instance;
    final CollectionReference products = _instance!.collection('products');
    DocumentSnapshot snapshirt = await products.doc('shirt').get();
    if (snapshirt.exists) {
      Map<String, dynamic> data = snapshirt.data() as Map<String, dynamic>;

      List<dynamic> dataShirt = data['shirt'] as List<dynamic>;

      for (var shirtData in dataShirt) {
        Shirts cat = Shirts.fromJson(shirtData);
        _shirts.add(cat);
      }
    }
    return _shirts;
  }
}
