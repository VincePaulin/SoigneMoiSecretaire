import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soigne_moi_secretaire/model/prescription.dart';
import 'package:soigne_moi_secretaire/model/review.dart';

class PatientTabs extends StatelessWidget {
  final List<ReviewModel> reviews;
  final List<Prescription> prescriptions;

  const PatientTabs({
    super.key,
    required this.reviews,
    required this.prescriptions,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Avis médical'),
              Tab(text: 'Prescription'),
            ],
          ),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                ReviewsList(reviews: reviews),
                PrescriptionsList(prescriptions: prescriptions),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewsList extends StatelessWidget {
  final List<ReviewModel> reviews;
  const ReviewsList({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const Center(child: Text('Aucune donnée pour le moment'));
    }
    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return ListTile(
          title: Text(review.title),
          subtitle: Text(
            '${review.description}\n${review.doctorName ?? 'Unknown Doctor'} - ${review.date != null ? DateFormat('dd/MM/yyyy').format(review.date!) : 'Unknown Date'}',
          ),
        );
      },
    );
  }
}

class PrescriptionsList extends StatelessWidget {
  final List<Prescription> prescriptions;
  const PrescriptionsList({super.key, required this.prescriptions});

  @override
  Widget build(BuildContext context) {
    if (prescriptions.isEmpty) {
      return const Center(child: Text('Aucune donnée pour le moment'));
    }
    return ListView.builder(
      itemCount: prescriptions.length,
      itemBuilder: (context, index) {
        final prescription = prescriptions[index];
        return ListTile(
          title: Text('Prescription ${index + 1}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(prescription.doctor!),
              Text(
                  'Start: ${DateFormat('dd/MM/yyyy').format(prescription.startDate)}'),
              Text(
                  'End: ${DateFormat('dd/MM/yyyy').format(prescription.endDate)}'),
              ...prescription.drugs
                  .map((drug) => Text('${drug.name}: ${drug.dosage}')),
            ],
          ),
        );
      },
    );
  }
}
