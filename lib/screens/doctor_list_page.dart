import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/model/doctor.dart';
import 'package:soigne_moi_secretaire/screens/home/home.dart';
import 'package:soigne_moi_secretaire/widgets/custom_avatar.dart';
import 'package:soigne_moi_secretaire/widgets/doctor_dialog.dart';

class DoctorsView extends StatelessWidget {
  final HomeController controller;
  const DoctorsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<Doctor> doctors = controller.filteredDoctorsList.isNotEmpty
        ? controller.filteredDoctorsList
        : controller.doctorsList;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              controller
                  .filterDoctors(value); // Appeler la fonction de filtrage
            },
            decoration: const InputDecoration(
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        ListView.builder(
          itemCount: doctors.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                key: const Key('doctorItem'),
                leading: CustomAvatar(
                  sex: doctors[index].sex,
                  avatarUrl: doctors[index].avatarURL,
                ),
                title: Text(doctors[index].fullName),
                subtitle: Text(doctors[index].specialty),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DoctorDetailsDialog(
                        doctor: doctors[index],
                      );
                    },
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
