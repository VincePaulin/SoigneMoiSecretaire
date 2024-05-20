import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soigne_moi_secretaire/model/stay.dart';
import 'package:soigne_moi_secretaire/model/user.dart';
import 'package:soigne_moi_secretaire/screens/medical_folder/medical_folder.dart';
import 'package:soigne_moi_secretaire/screens/medical_folder/patient_header.dart';
import 'package:soigne_moi_secretaire/screens/medical_folder/patient_tabs.dart';
import 'package:soigne_moi_secretaire/screens/medical_folder/stay_section.dart';

class MedicalFolderPage extends StatelessWidget {
  final FolderController folder;
  final User user;
  const MedicalFolderPage(
      {super.key, required this.folder, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Patient information header
            PatientInfoHeader(user: user),
            const SizedBox(height: 16),
            // Tabs for basic information, health history, and medical records
            PatientTabs(
              reviews: folder.medicalFolder!.reviews,
              prescriptions: folder.medicalFolder!.prescriptions,
            ),
            const SizedBox(height: 16),
            // Problems section
            StaysSection(
              stays: folder.medicalFolder!.stays,
            ),
          ],
        ),
      ),
    );
  }
}
