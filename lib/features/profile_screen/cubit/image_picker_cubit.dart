import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  final String userEmail;
  Uint8List? selectedImage;
  final Box userBox = Hive.box('IMAGE_BOX');
  ImagePickerCubit({required this.userEmail}) : super(ImagePickerInitial());

  Future<void> loadImage() async {
    String profileImageKey = 'profile_image_$userEmail';
    final imagePath = userBox.get(profileImageKey);

    if (imagePath != null && imagePath is Uint8List) {
      selectedImage = imagePath; // تعيين الصورة المحفوظة
      emit(LoadImagePicker());
    } else {
      print('No image found for this user.'); // إذا لم يتم العثور على صورة
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final imageData =
          await image.readAsBytes(); // قراءة بيانات الصورة كـ Uint8List

      selectedImage = imageData; // تحديث الصورة في واجهة المستخدم
      emit(ImagePickerr());

      String profileImageKey = 'profile_image_$userEmail';
      await userBox.put(
          profileImageKey, imageData); // حفظ بيانات الصورة كـ Uint8List

      // رسائل التصحيح
      print('Image saved for key: $profileImageKey');
    }
  }
}
