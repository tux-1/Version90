class Student {
  String name;
  String code;
  String religion;
  String gender;
  String nationality;
  String birthDate;
  String birthPlace;
  String nationalId;
  String address;
  String phone;
  String mobile;
  String email;
  String password;

  Student({
    required this.name,
    required this.code,
    required this.religion,
    required this.gender,
    required this.nationality,
    required this.birthDate,
    required this.birthPlace,
    required this.nationalId,
    required this.address,
    required this.phone,
    required this.mobile,
    required this.email,
    required this.password, // إضافة حقل كلمة المرور
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'religion': religion,
      'gender': gender,
      'nationality': nationality,
      'birthDate': birthDate,
      'birthPlace': birthPlace,
      'nationalId': nationalId,
      'address': address,
      'phone': phone,
      'mobile': mobile,
      'email': email,
      'password': password,
    };
  }
}