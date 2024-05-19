import 'package:flutter/material.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for list view
    final entries = [
      {'name': 'John Doe', 'motif': 'Consultation'},
      {'name': 'Jane Smith', 'motif': 'Opération'},
      {'name': 'Bob Johnson', 'motif': 'Contrôle'},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Entrés'),
            const SizedBox(height: 8),
            // Use Flexible with FlexFit.loose to avoid undefined constraints
            Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  return ListTile(
                    title: Text(entry['name']!),
                    subtitle: Text(entry['motif']!),
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
