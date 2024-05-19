import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/api/api_function.dart';
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

  static const List<String> pageTitles = [
    'Tableau de bord',
    'Patients',
    'Docteurs',
  ];

  @override
  void initState() {
    super.initState();
    fetchEntryOutput();
  }

  void updateIndex(int index) {
    setState(() => selectedIndex = index);
  }

  String get selectedPageTitle => pageTitles[selectedIndex];

  Future<void> fetchEntryOutput() async {
    try {
      final data = await Api().fetchOngoingStays();
      final entryData = data['entry'] as List<dynamic>;
      final outputData = data['output'] as List<dynamic>;

      setState(() {
        entrys = entryData.map((item) => Stay.fromJson(item)).toList();
        outputs = outputData.map((item) => Stay.fromJson(item)).toList();
      });
    } catch (e) {
      showErrorDialog(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(
      controller: this,
    );
  }
}
