import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lockers_app_blocs/blocs/student/get_students_bloc/get_students_bloc.dart';
import 'package:lockers_app_blocs/blocs/student/update_student_bloc/update_student_bloc.dart';
import 'package:lockers_app_blocs/components/ceff_dropdown_field.dart';
import 'package:lockers_app_blocs/components/ceff_elevated_button.dart';
import 'package:lockers_app_blocs/components/ceff_text_field.dart';
import 'package:student_repository/student_repository.dart';

class StudentUpdate extends StatefulWidget {
  const StudentUpdate({
    super.key,
    required this.student,
    this.updateSearchStudentList,
    this.showUpdateForm,
  });

  final Function()? showUpdateForm;
  final Function()? updateSearchStudentList;
  final Student student;

  @override
  State<StudentUpdate> createState() => _StudentUpdateState();
}

class _StudentUpdateState extends State<StudentUpdate> {
  // Tools for update student
  late final firstnameController =
      TextEditingController(text: widget.student.firstName);
  late final lastnameController =
      TextEditingController(text: widget.student.lastName);
  late final mailController = TextEditingController(
      text:
          "${widget.student.firstName.replaceAll(' ', '').toLowerCase()}.${widget.student.lastName.replaceAll(' ', '').toLowerCase()}@ceff.ch");
  late final jobController = TextEditingController(text: widget.student.job);
  late final loginController =
      TextEditingController(text: widget.student.login);
  late final yearController =
      TextEditingController(text: widget.student.year.toString());
  late final classeController =
      TextEditingController(text: widget.student.classe);
  late final responsableController =
      TextEditingController(text: widget.student.responsable);

  // Tools for student details
  // late Locker locker;

  final focusMail = FocusNode();
  final focusClasse = FocusNode();

  // Form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // if (widget.student.lockerNumber != 0) {
    //   locker = Provider.of<LockerStudentProvider>(context)
    //       .getLockerByLockerNumber(widget.student.lockerNumber);
    // }

    return Padding(
      padding: const EdgeInsets.only(
        left: 100,
        right: 100,
        bottom: 20,
      ),
      child: BlocListener<UpdateStudentBloc, UpdateStudentState>(
        listener: (context, state) {
          if (state is UpdateStudentSuccess) {
            context.read<GetStudentsBloc>().add(GetStudents());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "L'étudiant ${widget.student.firstName} ${widget.student.lastName} a été modifié avec succès !"),
                duration: const Duration(seconds: 3),
              ),
            );
          } else if (state is UpdateStudentFailure) {
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CEFFTextField(
                        "Prénom",
                        const Icon(Icons.person_2_rounded),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        enabled: !widget.student.isArchived!,
                        controller: firstnameController,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CEFFTextField(
                        "Nom",
                        const Icon(Icons.person_rounded),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        enabled: !widget.student.isArchived!,
                        controller: lastnameController,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CEFFTextField(
                        "Login",
                        const Icon(Icons.login_rounded),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        enabled: !widget.student.isArchived!,
                        controller: loginController,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CEFFTextField(
                        "Mail",
                        const Icon(Icons.mail_rounded),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        enabled: !widget.student.isArchived!,
                        controller: mailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CEFFTextField(
                        "Classe",
                        const Icon(Icons.school_rounded),
                        focusNode: focusClasse,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        enabled: !widget.student.isArchived!,
                        controller: classeController,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CEFFDropdownField(
                        "Année...",
                        const {
                          "1": "1ère année",
                          "2": "2ème année",
                          "3": "3ème année",
                          "4": "4ème année",
                        },
                        enabled: !widget.student.isArchived!,
                        icon: Icons.calendar_today_outlined,
                        onChanged: (value) {
                          setState(() {
                            yearController.text = value!;
                          });
                        },
                        choosedItem: yearController.text,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CEFFTextField(
                        "Formation",
                        const Icon(Icons.work_rounded),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        enabled: !widget.student.isArchived!,
                        controller: jobController,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CEFFTextField(
                        "Maître de classe",
                        const Icon(Icons.admin_panel_settings_rounded),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        enabled: !widget.student.isArchived!,
                        controller: responsableController,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CEFFElevatedButton(
                        "Annuler",
                        onPressed: widget.student.isArchived!
                            ? null
                            : () {
                                widget.showUpdateForm!();
                              },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CEFFElevatedButton(
                        "Enregistrer",
                        onPressed: widget.student.isArchived!
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  Student student = widget.student.copyWith(
                                    firstName: firstnameController.text,
                                    lastName: lastnameController.text,
                                    login: loginController.text,
                                    job: jobController.text,
                                    classe: classeController.text,
                                    responsable: responsableController.text,
                                    year: int.parse(yearController.text),
                                  );

                                  context
                                      .read<UpdateStudentBloc>()
                                      .add(UpdateStudent(student));
                                }
                              },
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              // if (widget.student.lockerNumber != 0)
              //   Row(
              //     children: [
              //       Expanded(
              //         child: Padding(
              //           padding: const EdgeInsets.all(20),
              //           child: TextField(
              //             readOnly: true,
              //             enableInteractiveSelection: false,
              //             decoration: InputDecoration(
              //               hintText:
              //                   "Casier n°${locker.lockerNumber.toString()}",
              //               prefixIcon:
              //                   const Icon(Icons.admin_panel_settings_outlined),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         child: Padding(
              //           padding: const EdgeInsets.all(20),
              //           child: TextField(
              //             readOnly: true,
              //             enableInteractiveSelection: false,
              //             decoration: InputDecoration(
              //               hintText: "Étage ${locker.floor.toUpperCase()}",
              //               prefixIcon: const Icon(Icons.location_on_outlined),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         child: Padding(
              //           padding: const EdgeInsets.all(20),
              //           child: TextField(
              //             readOnly: true,
              //             enableInteractiveSelection: false,
              //             decoration: InputDecoration(
              //               hintText: "${locker.nbKey.toString()} clés",
              //               prefixIcon: const Icon(Icons.vpn_key_outlined),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   )
            ],
          ),
        ),
      ),
    );
  }
}
