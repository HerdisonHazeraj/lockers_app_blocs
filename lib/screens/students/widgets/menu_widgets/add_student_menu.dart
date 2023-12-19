import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lockers_app_blocs/blocs/student/create_student_bloc/create_student_bloc.dart';
import 'package:lockers_app_blocs/blocs/student/get_students_bloc/get_students_bloc.dart';
import 'package:lockers_app_blocs/components/ceff_dropdown_field.dart';
import 'package:lockers_app_blocs/components/ceff_elevated_button.dart';
import 'package:lockers_app_blocs/components/ceff_text_field.dart';
import 'package:lockers_app_blocs/components/ceff_titlemenu_text.dart';
import 'package:student_repository/student_repository.dart';

class AddStudentMenu extends StatefulWidget {
  const AddStudentMenu({super.key});

  @override
  State<AddStudentMenu> createState() => _AddStudentMenuState();
}

class _AddStudentMenuState extends State<AddStudentMenu> {
  late Student student;

  // Controllers for the adding student form
  final firstnameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mailController = TextEditingController();
  final jobController = TextEditingController();
  final loginController = TextEditingController();
  final yearController = TextEditingController();
  final classeController = TextEditingController();
  final responsableController = TextEditingController();

  final focusFirstName = FocusNode();
  final focusLastName = FocusNode();
  final focusMail = FocusNode();
  final focusJob = FocusNode();
  final focusLogin = FocusNode();
  final focusYear = FocusNode();
  final focusClasse = FocusNode();
  final focusResponsable = FocusNode();

  // Form key
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    student = Student.empty;
  }

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
        BlocListener<CreateStudentBloc, CreateStudentState>(
          listener: (context, state) {
            if (state is CreateStudentSuccess) {
              context.read<GetStudentsBloc>().add(GetStudents());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'L\'élève "${student.firstName} ${student.lastName}" a été ajouté avec succès !'),
                  duration: const Duration(seconds: 3),
                ),
              );
            } else if (state is CreateStudentFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: Form(
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
                            focusNode: focusLogin,
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
                  child: CEFFElevatedButton(
                    "Ajouter",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        student.firstName = firstnameController.text;
                        student.lastName = lastNameController.text;
                        student.login = loginController.text;
                        student.classe = classeController.text;
                        student.year = int.parse(yearController.text);
                        student.job = jobController.text;
                        student.responsable = responsableController.text;

                        context.read<CreateStudentBloc>().add(
                              CreateStudent(student),
                            );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
