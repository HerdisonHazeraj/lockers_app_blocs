import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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
          child: Text(
            "Importer un fichier CSV",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TextField(
                controller: fileController,
                decoration: const InputDecoration(
                  labelText: "Choisir...",
                  prefixIcon: Icon(Icons.file_upload_outlined),
                ),
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
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black54),
                ),
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
                child: const Text("Importer"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
