import 'package:soigne_moi_secretaire/model/prescription.dart';
import 'package:soigne_moi_secretaire/model/review.dart';
import 'package:soigne_moi_secretaire/model/stay.dart';

class MedicalFolderModel {
  final List<Prescription> prescriptions;
  final List<ReviewModel> reviews;
  final List<Stay> stays;

  MedicalFolderModel({
    required this.prescriptions,
    required this.reviews,
    required this.stays,
  });

  factory MedicalFolderModel.fromJson(Map<String, dynamic> json) {
    return MedicalFolderModel(
      prescriptions: (json['prescriptions'] as List<dynamic>)
          .map((item) => Prescription.fromJson(item))
          .toList(),
      reviews: (json['avis'] as List<dynamic>)
          .map((item) => ReviewModel.fromJson(item))
          .toList(),
      stays: (json['stays'] as List<dynamic>)
          .map((item) => Stay.fromJson(item))
          .toList(),
    );
  }
}
