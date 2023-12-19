import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lockers_app_blocs/components/ceff_elevated_button.dart';
import 'package:lockers_app_blocs/components/ceff_text_field.dart';
import 'package:lockers_app_blocs/components/ceff_titlemenu_text.dart';

class ImportLockerMenu extends StatefulWidget {
  ImportLockerMenu({super.key});
  final List<Widget> items = [];

  @override
  State<ImportLockerMenu> createState() => _ImportLockerMenuState();
}

class _ImportLockerMenuState extends State<ImportLockerMenu> {
  // Controllers for the importing student form
  final fileController = TextEditingController();

  late FilePickerResult? filePicker;

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        const SizedBox(
          width: double.infinity,
          child: CEFFTitleMenuText(
            "Importer un fichier CSV",
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CEFFTextField(
                "Choisir...",
                const Icon(Icons.file_upload_rounded),
                controller: fileController,
                readOnly: true,
                onTap: () async {
                  filePicker = (await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['csv'],
                    withData: true,
                  ));

                  if (filePicker != null) {
                    fileController.text = filePicker!.files.single.name;
                  }
                },
              ),
            ),
            const SizedBox(
              width: 38,
            ),
            Expanded(
              child: CEFFElevatedButton(
                "Importer",
                onPressed: () async {
                  // final error = await Provider.of<LockerStudentProvider>(
                  //   context,
                  //   listen: false,
                  // ).importLockersWithCSV(filePicker!);
                  // if (error != null) {
                  //   ScaffoldMessenger.of(context)
                  //       .showSnackBar(SnackBar(content: Text(error)));
                  // } else {
                  //   // ignore: use_build_context_synchronously
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text("Importation réussie"),
                  //     ),
                  //   );

                  //   fileController.clear();
                  // }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
