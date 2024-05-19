import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/screens/home/home.dart';

class ExitCard extends StatelessWidget {
  final HomeController controller;
  const ExitCard({super.key, required this.controller});

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
              'Sorties',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.outputs.length,
                itemBuilder: (context, index) {
                  final output = controller.outputs[index];
                  return ListTile(
                    title:
                        Text("${output.user?.firstName} ${output.user?.name}"),
                    subtitle: Text(output.motif),
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
