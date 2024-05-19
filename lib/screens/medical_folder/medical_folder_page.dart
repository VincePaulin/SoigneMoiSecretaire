import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/model/user.dart';

class MedicalFolderPage extends StatelessWidget {
  final User user;
  const MedicalFolderPage({super.key, required this.user});

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
            const PatientTabs(),
            const SizedBox(height: 16),
            // Problems section
            const ProblemsSection(),
          ],
        ),
      ),
    );
  }
}

class PatientInfoHeader extends StatelessWidget {
  final User user;
  const PatientInfoHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            user.email,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Numéro: ${user.id}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 16),
              Text(
                user.address!,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          // We could put the weight and height here
        ],
      ),
    );
  }
}

class PatientTabs extends StatelessWidget {
  const PatientTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: const [
          TabBar(
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
                Center(child: Text('Avis Médical')),
                Center(child: Text('Prescription')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProblemsSection extends StatelessWidget {
  const ProblemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Séjours',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Diabetes'),
            subtitle: const Text('Start at 27-04-2013\nDiagnosed by Dr. João Sequeira, Hospital of Light'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Dor no Peito'),
            subtitle: const Text('Start at 22-03-2000\nDiagnosed by Dr. João Sequeira, Hospital da Luz'),
          ),
        ],
      ),
    );
  }
}
