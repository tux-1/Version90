class Administrator {
  final String name;
  final String code;
  final String religion;
  final String gender;
  final String nationality;
  final String birthDate;
  final String birthPlace;
  final String nationalId;
  final String address;
  final String phone;
  final String mobile;
  final String email;

  Administrator({
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
  });

  Map<String, dynamic> toJson() {
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
    };
  }
}
