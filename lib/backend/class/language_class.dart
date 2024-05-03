class UserLanguage {
  final int id;
  final int userId;
  late String name;
  late int percentage;

  UserLanguage({
    required this.id,
    required this.userId,
    required this.name,
    required this.percentage,
  });

  factory UserLanguage.fromJson(Map<String, dynamic> json) {
    return UserLanguage(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      percentage: json['percentage'],
    );
  }
}
