import 'dart:io';

abstract class FirebaseStorageABST {
  Future<String> uploadProfileToFirebase(File image);
}
