import 'package:faculty_project/model/account_type.dart';

class AppNotification {
  final String title;
  final String content;
  final AccountType accountType;

  AppNotification({
    required this.title,
    required this.content,
    required this.accountType,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      title: json['title'] as String,
      content: json['content'] as String,
      accountType: AccountType.values.firstWhere(
        (e) => e.name == json['account_type'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'account_type': accountType.name,
    };
  }
}
