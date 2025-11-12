class SignUpReqestBody {
  final String email;
  final String password;
  //map

  final DataSignUpBody data;

  SignUpReqestBody(
    this.email,
    this.password,
    this.data,
  );
}

class DataSignUpBody {
  final String phone;

  final String name;
  final String lastname;
  final String image;
  final String gender;

  DataSignUpBody(
    this.name,
    this.lastname,
    this.image,
    this.gender,
    this.phone,
  );
  Map<String, dynamic> toJson() => <String, dynamic>{
        'image': image,
        'name': name,
        'lastname': lastname,
        'gender': gender,
        "phone": phone
      };
}
