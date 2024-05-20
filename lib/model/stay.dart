import 'package:soigne_moi_secretaire/model/user.dart';

class Stay {
  final String? id;
  final String motif;
  final String type;
  final DateTime startDate;
  final DateTime endDate;
  final String? precision;
  final String? doctorId;
  final String? userId;
  final User? user;

  Stay({
    this.id,
    required this.motif,
    required this.type,
    required this.startDate,
    required this.endDate,
    this.precision,
    this.doctorId,
    this.userId,
    this.user,
  });

  factory Stay.fromJson(Map<String, dynamic> json) {
    return Stay(
      id: json['id'].toString() ?? '',
      motif: json['motif'] ?? '',
      type: json['type'] ?? '',
      startDate: _parseDate(json['start_date']),
      endDate: _parseDate(json['end_date']),
      precision: json['precision'] ?? "",
      doctorId:
          json['doctor_id'].toString(), // Assuming doctorId is nullable in JSON
      userId: json['user_id'].toString() ?? "",
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  static DateTime _parseDate(dynamic date) {
    if (date == null) {
      return DateTime.now();
    }
    // Assuming date is in the format 'yyyy-MM-ddTHH:mm:ss.000000Z'
    final parsedDate = DateTime.parse(date);
    return DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
  }
}
