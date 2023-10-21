import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import '../../constant/strings.dart';
import 'firebase_storage_abstract.dart';

class FirebaseStorageImpl extends FirebaseStorageABST {
  FirebaseStorageImpl._();

  static final FirebaseStorageImpl _singleton = FirebaseStorageImpl._();

  factory FirebaseStorageImpl() => _singleton;

  final _firebaseStorage = FirebaseStorage.instance;

  @override
  Future<String> uploadProfileToFirebase(File image) {
    int id = DateTime.now().millisecondsSinceEpoch;
    if (image.path.isEmpty) {
      return Future.value('');
    }
    return _firebaseStorage
        .ref(kImagesPath)
        .child(id.toString())
        .putFile(image)
        .then((takeSnapShot) {
      return takeSnapShot.ref.getDownloadURL();
    });
  }
}
