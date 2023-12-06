import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lockers_app_blocs/components/ceff_elevated_button.dart';
import 'package:lockers_app_blocs/components/ceff_text_field.dart';
import 'package:lockers_app_blocs/components/ceff_titlemenu_text.dart';

class ImportAllMenu extends StatefulWidget {
  ImportAllMenu({super.key});
  final List<Widget> items = [];

  @override
  State<ImportAllMenu> createState() => _ImportAllMenuState();
}

class _ImportAllMenuState extends State<ImportAllMenu> {
  final fileController = TextEditingController();
  late FilePickerResult? pickedFile;

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
                  pickedFile = (await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['csv'],
                    allowMultiple: false,
                    withData: true,
                  ));

                  if (pickedFile != null) {
                    fileController.text = pickedFile!.files.single.name;
                  }
                },
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Expanded(
              child: CEFFElevatedButton(
                "Importer",
                onPressed: () async {
                  // écrire la méthode
                  // final error = await Provider.of<LockerStudentProvider>(
                  //   context,
                  //   listen: false,
                  // ).importAllWithCSV(pickedFile!);
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

                  // final message = await Provider.of<LockerStudentProvider>(
                  //   context,
                  //   listen: false,
                  // ).importAllWithXLSX(pickedFile!);

                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text(message),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
