enum AccountType {
  student,
  professor,
  admin;

  String get collection {
    switch (this) {
      case AccountType.student:
        return 'students';
      case AccountType.professor:
        return 'professors';
      case AccountType.admin:
        return 'administrators';
    }
  }
}