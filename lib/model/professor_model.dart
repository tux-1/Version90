class Professor {
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
  final String? imageUrl;

  Professor({
    this.imageUrl,
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

  factory Professor.fromJson(Map<String, dynamic> json) {
    return Professor(
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
      imageUrl: json['imageUrl']
    );
  }

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
