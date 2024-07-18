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
    required this.password,
  });

  // Convert a Student object to a map
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

  // Create a Student object from a map
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      code: json['code'],
      religion: json['religion'],
      gender: json['gender'],
      nationality: json['nationality'],
      birthDate: json['birthDate'],
      birthPlace: json['birthPlace'],
      nationalId: json['nationalId'],
      address: json['address'],
      phone: json['phone'],
      mobile: json['mobile'],
      email: json['email'],
      password: json['password'],
    );
  }
}
