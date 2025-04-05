import 'package:image_picker/image_picker.dart';

class Helper {
  static Future<XFile?> getImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image;
    } else {
      return null;
    }
  }
}
