import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/model/doctor.dart';

import 'custom_avatar.dart';
import 'doctor_dialog.dart';

class TodayDoctorList extends StatelessWidget {
  final List<Doctor> doctors;
  const TodayDoctorList({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Docteur présents aujourd'hui",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            doctors.isEmpty
                ? Text("Aucun docteur présent aujourd'hui")
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = doctors[index];
                      return TodayDoctorItem(
                        doctor: doctor,
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class TodayDoctorItem extends StatelessWidget {
  final Doctor doctor;

  const TodayDoctorItem({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomAvatar(
        sex: doctor.sex,
        avatarUrl: doctor.avatarURL,
      ),
      title: Text(doctor.fullName),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(doctor.specialty),
        ],
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return DoctorDetailsDialog(
              doctor: doctor,
            );
          },
        );
      },
    );
  }
}
