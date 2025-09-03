import 'dart:io';

class ProfileModel {
  final String? email;
  final String? password;
  final DateProfile? data;
  final String? imagePath;
  final File? imageFile;

  ProfileModel({
    this.email,
    this.password,
    this.data,
    this.imagePath,
    this.imageFile,
  });
}

class DateProfile {
  final String? phone;

  final String? name;
  final String? lastname;
  final String? image;
  final String? gender;

  DateProfile({
    this.name,
    this.lastname,
    this.image,
    this.gender,
    this.phone,
  });
  Map<String, dynamic> toJson(String? newImage) => <String, dynamic>{
        'image': newImage ?? image,
        'name': name,
        'lastname': lastname,
        'gender': gender,
        "phone": phone
      };
}
