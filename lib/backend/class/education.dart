class UserEducation {
  final int id;
  final int userId;
  final String title;
  final String type;
  final String startYear;
  final String endYear;
  final String summary;

  UserEducation({
    required this.id,
    required this.userId,
    required this.title,
    required this.type,
    required this.startYear,
    required this.endYear,
    required this.summary,
  });

  factory UserEducation.fromJson(Map<String, dynamic> json) {
    return UserEducation(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      type: json['type'],
      startYear: json['start_year'],
      endYear: json['end_year'],
      summary: json['summary'],
    );
  }
}
