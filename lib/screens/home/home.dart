import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/api/api_function.dart';
import 'package:soigne_moi_secretaire/model/doctor.dart';
import 'package:soigne_moi_secretaire/model/stay.dart';
import 'package:soigne_moi_secretaire/widgets/error_dialog.dart';
import 'home_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeController createState() => HomeController();
}

class HomeController extends State<Home> {
  int selectedIndex = 0;
  List<Stay> entrys = [];
  List<Stay> outputs = [];
  List<Doctor> doctorToday = [];
  bool loading = true;

  static const List<String> pageTitles = [
    'Tableau de bord',
    'Patients',
    'Docteurs',
  ];

  @override
  void initState() {
    super.initState();
    fetchEntryOutput();
    fetchDoctorToday();
  }

  void updateIndex(int index) {
    setState(() => selectedIndex = index);
  }

  String get selectedPageTitle => pageTitles[selectedIndex];

  void reload() {
    setState(() => loading = true);
    fetchEntryOutput();
  }

  Future<void> fetchEntryOutput() async {
    try {
      final data = await Api().fetchOngoingStays();
      final entryData = data['entry'] as List<dynamic>;
      final outputData = data['output'] as List<dynamic>;

      setState(() {
        entrys = entryData.map((item) => Stay.fromJson(item)).toList();
        outputs = outputData.map((item) => Stay.fromJson(item)).toList();
        loading = false;
      });
    } catch (e) {
      showErrorDialog(e.toString(), context);
    }
  }

  Future<void> fetchDoctorToday() async {
    try {
      final data = await Api().fetchDoctorPresent();
      final doctorData = data['doctors'] as List<dynamic>;

      setState(() {
        doctorToday = doctorData.map((item) => Doctor.fromJson(item)).toList();
        loading = false;
      });
    } catch (e) {
      showErrorDialog(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return HomePage(
        controller: this,
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
