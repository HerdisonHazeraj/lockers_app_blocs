import 'package:flutter/material.dart';
import 'package:lockers_app_blocs/components/ceff_dropdown_field.dart';
import 'package:lockers_app_blocs/components/ceff_text_field.dart';
import 'package:lockers_app_blocs/components/ceff_titlemenu_text.dart';

class AddStudentMenu extends StatefulWidget {
  const AddStudentMenu({super.key});

  @override
  State<AddStudentMenu> createState() => _AddStudentMenuState();
}

class _AddStudentMenuState extends State<AddStudentMenu> {
  // Controllers for the adding student form
  final firstnameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mailController = TextEditingController();
  final jobController = TextEditingController();
  final loginController = TextEditingController();
  final yearController = TextEditingController();
  final classeController = TextEditingController();
  final responsableController = TextEditingController();

  // Form key
  final _formKey = GlobalKey<FormState>();

  final focusFirstName = FocusNode();
  final focusLastName = FocusNode();
  final focusMail = FocusNode();
  final focusJob = FocusNode();
  final focusLogin = FocusNode();
  final focusYear = FocusNode();
  final focusClasse = FocusNode();
  final focusResponsable = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        const SizedBox(
          width: double.infinity,
          child: CEFFTitleMenuText(
            "Ajouter un élève",
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CEFFTextField(
                          "Prénom",
                          const Icon(Icons.person_rounded),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez remplir ce champ';
                            } else {
                              FocusScope.of(context)
                                  .requestFocus(focusLastName);
                              return null;
                            }
                          },
                          focusNode: focusFirstName,
                          controller: firstnameController,
                          keyboardType: TextInputType.name,
                        ),
                        CEFFTextField(
                          "Login",
                          const Icon(Icons.login_rounded),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez remplir ce champ';
                            } else {
                              FocusScope.of(context).requestFocus(focusMail);
                              return null;
                            }
                          },
                          focusNode: focusLastName,
                          controller: loginController,
                          keyboardType: TextInputType.name,
                        ),
                        CEFFTextField(
                          "Classe",
                          const Icon(Icons.school_rounded),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez remplir ce champ';
                            } else {
                              FocusScope.of(context).requestFocus(focusLogin);
                              return null;
                            }
                          },
                          focusNode: focusClasse,
                          controller: classeController,
                          keyboardType: TextInputType.name,
                        ),
                        CEFFTextField(
                          "Formation",
                          const Icon(Icons.work_rounded),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez remplir ce champ';
                            }
                            return null;
                          },
                          focusNode: focusJob,
                          controller: jobController,
                          keyboardType: TextInputType.name,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 38,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        CEFFTextField(
                          "Nom",
                          const Icon(Icons.person_rounded),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez remplir ce champ';
                            }
                            return null;
                          },
                          focusNode: focusLastName,
                          controller: lastNameController,
                          keyboardType: TextInputType.name,
                        ),
                        CEFFTextField(
                          "Mail",
                          const Icon(Icons.mail_rounded),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez remplir ce champ';
                            }
                            return null;
                          },
                          focusNode: focusMail,
                          controller: mailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        CEFFDropdownField(
                          "Année...",
                          const {
                            "1": "1ère année",
                            "2": "2ème année",
                            "3": "3ème année",
                            "4": "4ème année",
                          },
                          enabled: true,
                          icon: Icons.calendar_today_outlined,
                          onChanged: (value) {
                            setState(() {
                              yearController.text = value!;
                            });
                          },
                        ),
                        CEFFTextField(
                          "Maître de classe",
                          const Icon(Icons.admin_panel_settings_rounded),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez remplir ce champ';
                            }
                            return null;
                          },
                          focusNode: focusResponsable,
                          controller: responsableController,
                          keyboardType: TextInputType.name,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Student student = Student(
                      //   firstName: firstnameController.text,
                      //   lastName: lastnameController.text,
                      //   job: jobController.text,
                      //   responsable: responsableController.text,
                      //   caution: 0,
                      //   lockerNumber: 0,
                      //   login: loginController.text,
                      //   year: int.parse(yearController.text),
                      //   classe: classeController.text,
                      // );

                      // Provider.of<LockerStudentProvider>(context, listen: false)
                      //     .addStudent(student);

                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //         'L\'élève "${student.firstName} ${student.lastName}" a été ajouté avec succès !'),
                      //     duration: const Duration(seconds: 3),
                      //   ),
                      // );

                      // firstnameController.clear();
                      // lastnameController.clear();
                      // jobController.clear();
                      // responsableController.clear();
                      // loginController.clear();
                      // yearController.clear();
                      // classeController.clear();
                      // mailController.clear();
                    }
                  },
                  child: const Text("Ajouter"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
