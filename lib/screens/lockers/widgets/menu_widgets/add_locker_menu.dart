import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker_repository/locker_repository.dart';
import 'package:lockers_app_blocs/blocs/locker/create_locker_bloc/create_locker_bloc.dart';
import 'package:lockers_app_blocs/blocs/locker/get_lockers_bloc/get_lockers_bloc.dart';
import 'package:lockers_app_blocs/components/ceff_dropdown_field.dart';
import 'package:lockers_app_blocs/components/ceff_elevated_button.dart';
import 'package:lockers_app_blocs/components/ceff_text_field.dart';
import 'package:lockers_app_blocs/components/ceff_titlemenu_text.dart';

class AddLockerMenu extends StatefulWidget {
  const AddLockerMenu({super.key});

  @override
  State<AddLockerMenu> createState() => _AddLockerMenuState();
}

class _AddLockerMenuState extends State<AddLockerMenu> {
  late Locker locker;

  // Controllers for the adding student form
  final lockNumberController = TextEditingController();
  final lockerNumberController = TextEditingController();
  final nbKeyController = TextEditingController();
  final floorController = TextEditingController();
  final jobController = TextEditingController();
  final remarkController = TextEditingController();

  //Focus Nodes
  final focusLockNumber = FocusNode();
  final focusLockerNumber = FocusNode();
  final focusNbKey = FocusNode();
  final focusFloor = FocusNode();
  final focusJob = FocusNode();
  final focusRemark = FocusNode();

  // Form key
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    locker = Locker.empty;
  }

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        const SizedBox(
          width: double.infinity,
          child: CEFFTitleMenuText(
            "Ajouter un casier",
          ),
        ),
        BlocListener<CreateLockerBloc, CreateLockerState>(
          listener: (context, state) {
            if (state is CreateLockerSuccess) {
              context.read<GetLockersBloc>().add(GetLockers());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Le casier n°${locker.lockerNumber} a été ajouté avec succès !'),
                  duration: const Duration(seconds: 3),
                ),
              );
            } else if (state is CreateLockerFailure) {
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
                            "N° de casier",
                            const Icon(Icons.lock_rounded),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez remplir ce champ';
                              } else {
                                FocusScope.of(context).requestFocus(focusNbKey);
                                return null;
                              }
                            },
                            focusNode: focusLockerNumber,
                            // onFieldSubmitted: (v) {
                            //   FocusScope.of(context).requestFocus(focusNbKey);
                            // },
                            controller: lockerNumberController,
                            keyboardType: TextInputType.number,
                          ),
                          CEFFTextField(
                            "N° de serrure",
                            const Icon(Icons.numbers_rounded),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez remplir ce champ';
                              } else {
                                FocusScope.of(context).requestFocus(focusJob);
                                return null;
                              }
                            },
                            focusNode: focusLockNumber,
                            controller: lockNumberController,
                            keyboardType: TextInputType.number,
                          ),
                          CEFFDropdownField(
                            "Étage...",
                            const {
                              "b": "Étage B",
                              "c": "Étage C",
                              "d": "Étage D",
                              "e": "Étage E",
                            },
                            enabled: true,
                            icon: Icons.calendar_today_rounded,
                            onChanged: (value) {
                              setState(() {
                                floorController.text = value!;
                              });
                            },
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
                            "Nombre de clés",
                            const Icon(Icons.key_rounded),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez remplir ce champ';
                              } else {
                                FocusScope.of(context)
                                    .requestFocus(focusLockNumber);
                                return null;
                              }
                            },
                            focusNode: focusNbKey,
                            controller: nbKeyController,
                            keyboardType: TextInputType.number,
                          ),
                          CEFFTextField(
                            "Métier",
                            const Icon(Icons.work_rounded),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez remplir ce champ';
                              } else {
                                FocusScope.of(context).requestFocus(focusFloor);
                                return null;
                              }
                            },
                            focusNode: focusJob,
                            controller: jobController,
                            keyboardType: TextInputType.name,
                          ),
                          CEFFTextField(
                            "Remarque (facultatif)",
                            const Icon(Icons.note_rounded),
                            focusNode: focusRemark,
                            controller: remarkController,
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
                        setState(() {
                          locker.lockNumber =
                              int.parse(lockNumberController.text);
                          locker.lockerNumber =
                              int.parse(lockerNumberController.text);
                          locker.nbKey = int.parse(nbKeyController.text);
                          locker.floor = floorController.text;
                          locker.job = jobController.text;
                          locker.remark = remarkController.text;
                        });

                        context
                            .read<CreateLockerBloc>()
                            .add(CreateLocker(locker));
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
