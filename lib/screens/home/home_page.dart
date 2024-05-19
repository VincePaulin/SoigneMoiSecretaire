import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/screens/dashboard_page.dart';
import 'package:soigne_moi_secretaire/screens/home/home.dart';
import 'package:soigne_moi_secretaire/widgets/home_header.dart';
import 'package:soigne_moi_secretaire/widgets/navigation_bar.dart';
import 'package:soigne_moi_secretaire/widgets/today_doctor.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Side navigation bar
          NavigationSidebar(
            controller: controller,
          ),
          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    HomeHeader(controller: controller),
                    // Main content
                    const SizedBox(height: 16),
                    // Inputs and outputs
                    _buildPage(controller.selectedIndex)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return DashboardPage(
          controller: controller,
        );
      case 1:
        return TodayDoctorList();
      default:
        return DashboardPage(
          controller: controller,
        );
    }
  }
}
