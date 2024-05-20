import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soigne_moi_secretaire/model/doctor.dart';

import 'custom_avatar.dart';

class DoctorDetailsDialog extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailsDialog({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              // Profile image
              Expanded(
                flex: 1,
                child: ProfileDoctorImage(
                  sex: doctor.sex,
                  avatarUrl: doctor.avatarURL,
                ),
              ),
              // Doctor's details
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildProfileHead(),
                          _buildProfileDetail(),
                        ],
                      ),
                      // Profile creation date
                      _buildProfileDate(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHead() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Profile",
          key: Key('pageTitle_Doctor Details'),
          style: TextStyle(
            color: Colors.red,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          doctor.fullName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Matricule:',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          doctor.matricule,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildProfileDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specialty:',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          doctor.specialty,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          children: doctor.medicalSections.map((section) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Chip(
                label: Text(
                  section,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.black,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  Widget _buildProfileDate() {
    final formatCreateDate = _formatDate(doctor.createdAt!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profile créé le: $formatCreateDate',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
