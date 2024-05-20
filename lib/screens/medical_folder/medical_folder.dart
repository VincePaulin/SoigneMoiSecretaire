import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/api/api_function.dart';
import 'package:soigne_moi_secretaire/model/medical_folder.dart';
import 'package:soigne_moi_secretaire/model/stay.dart';
import 'package:soigne_moi_secretaire/model/user.dart';
import 'package:soigne_moi_secretaire/widgets/error_dialog.dart';

import 'medical_folder_page.dart';

class MedicalFolder extends StatefulWidget {
  final User user;
  const MedicalFolder({super.key, required this.user});

  @override
  FolderController createState() => FolderController();
}

class FolderController extends State<MedicalFolder> {
  MedicalFolderModel? medicalFolder;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchData(widget.user.id.toString());
  }

  Future<void> fetchData(String id) async {
    try {
      final data = await Api().fetchUserFolder(id);
      setState(() {
        medicalFolder = MedicalFolderModel.fromJson(data);
        loading = false;
      });
    } catch (e) {
      showErrorDialog(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return MedicalFolderPage(
        folder: this,
        user: widget.user,
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
