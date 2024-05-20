import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/screens/home/home.dart';
import 'package:soigne_moi_secretaire/screens/medical_folder/medical_folder.dart';

class EntryCard extends StatelessWidget {
  final HomeController controller;
  const EntryCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Entrés',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: controller.entrys.isEmpty
                  ? Center(
                      child: Text(
                        "Aucune entrée de prévu aujourd'hui",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.entrys.length,
                      itemBuilder: (context, index) {
                        final entry = controller.entrys[index];
                        return ListTile(
                          key: const Key('entryItem'),
                          title: Text(
                              "${entry.user!.firstName} ${entry.user!.name}"),
                          subtitle: Text(entry.motif),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MedicalFolder(
                                  user: entry.user!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
