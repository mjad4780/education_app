import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart'; // For MediaType

Future uploadImageToAPI(
  File? image,
) async {
  return MultipartFile.fromFile(image!.path,
      filename: image.path.split('/').last);
}

imageuploadcamer() async {
  final XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

imageuploadgallery() async {
  final XFile? file = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

Future<MultipartFile> hundleImage() async {
  File? file;
  final bytes = await file!.readAsBytes();
  final fileExtension = file.path.split('.').last.toLowerCase();

  // 1. Validate the image is actually a supported format
  bool isJpeg = bytes.length > 2 && bytes[0] == 0xFF && bytes[1] == 0xD8;
  bool isPng = bytes.length > 4 &&
      bytes[0] == 0x89 &&
      bytes[1] == 0x50 &&
      bytes[2] == 0x4E &&
      bytes[3] == 0x47;

  if (!isJpeg && !isPng) {
    throw Exception(
        'Image is not a valid JPEG or PNG (extension was .$fileExtension)');
  }

  // 2. Create proper multipart file with correct content-type
  final contentType =
      isJpeg ? MediaType('image', 'jpeg') : MediaType('image', 'png');

  final imageFile = await MultipartFile.fromFile(
    file.path,
    filename: 'profile.${isJpeg ? 'jpg' : 'png'}', // Force correct extension
    contentType: contentType,
  );
  return imageFile;
}
// fillle([issvg = false]) async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions:
//           issvg ? ["svg", "SVG"] : ["png", "PNG" "jpg", "jpeg", "gif"]);

//   if (result != null) {
//     return File(result.files.single.path!);
//   } else {
//     return null;
//   }
// }
