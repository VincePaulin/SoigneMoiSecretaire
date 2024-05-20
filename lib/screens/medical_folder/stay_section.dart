import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soigne_moi_secretaire/model/stay.dart';

class StaysSection extends StatelessWidget {
  final List<Stay> stays;
  const StaysSection({super.key, required this.stays});

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
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: stays.length,
            itemBuilder: (context, index) {
              final stay = stays[index];
              final startDate = DateFormat('dd/MM/yyyy').format(stay.startDate);
              final endDate = DateFormat('dd/MM/yyyy').format(stay.endDate);
              return Column(
                children: [
                  ListTile(
                    title: Text(stay.motif),
                    subtitle: Text(
                        'Start at $startDate\nEnd at $endDate\nSection: ${stay.type}'),
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
