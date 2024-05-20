// Prescription model
class Prescription {
  final int? id;
  final int? patientId;
  final List<Drug> drugs;
  final DateTime startDate;
  DateTime endDate;
  final String? doctor;

  Prescription({
    this.id,
    this.patientId,
    required this.drugs,
    required this.startDate,
    required this.endDate,
    this.doctor,
  });

  // Copy constructor
  Prescription.copy(Prescription prescription)
      : patientId = prescription.patientId,
        id = prescription.id,
        drugs = List<Drug>.from(prescription.drugs),
        startDate = prescription.startDate,
        endDate = prescription.endDate,
        doctor = prescription.doctor;

  // Method to update the end date of the prescription
  void updateEndDate(DateTime newEndDate) {
    endDate = newEndDate;
  }

  // Method to convert Prescription from JSON
  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      id: json['id'],
      drugs: (json['drugs'] as List<dynamic>)
          .map((drugJson) => Drug.fromJson(drugJson))
          .toList(),
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      doctor: json['doctor'] ?? "",
    );
  }
}

// Drug model
class Drug {
  final String name;
  final String dosage;

  Drug({
    required this.name,
    required this.dosage,
  });

  // Method to convert Drug from JSON
  factory Drug.fromJson(Map<String, dynamic> json) {
    return Drug(
      name: json['drug'] as String,
      dosage: json['dosage'] as String,
    );
  }
}
