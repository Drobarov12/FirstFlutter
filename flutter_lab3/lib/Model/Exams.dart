class Exams {
  final String title;
  final String description;
  final DateTime dateOfExam;
  final DateTime startTime;
  final DateTime endTime;
  final String longitude;
  final String latitude;

  Exams({
    required this.title,
    required this.description,
    required this.dateOfExam,
    required this.startTime,
    required this.endTime,
    required this.longitude,
    required this.latitude,
  });
}
