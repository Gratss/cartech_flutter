import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<String?> uploadCarPhoto(File imageFile) async {
  try {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('car_photos/${DateTime.now().toString()}');
    UploadTask uploadTask = ref.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  } catch (e) {
    // Обработка ошибок при загрузке фотографии
    return null;
  }
}
