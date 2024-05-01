class UserSkill {
  final int id;
  final int userId;
  final String name;

  UserSkill({
    required this.id,
    required this.userId,
    required this.name,
  });

  factory UserSkill.fromJson(Map<String, dynamic> json) {
    return UserSkill(
      id: json['id'],
      userId: json['users_id'],
      name: json['name'],
    );
  }
}
