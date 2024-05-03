class UserAward {
  final int id;
  final int userId;
  final String name;
  final String year;
  final String certificate;

  UserAward({
    required this.id,
    required this.userId,
    required this.name,
    required this.year,
    required this.certificate,
  });

  factory UserAward.fromJson(Map<String, dynamic> json) {
    return UserAward(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      year: json['year'],
      certificate: json['certificate'],
    );
  }
}
