import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker_repository/user_repository.dart';
import 'package:lockers_app_blocs/blocs/locker/get_lockers_bloc/get_lockers_bloc.dart';
import 'package:lockers_app_blocs/blocs/locker/update_locker_bloc/update_locker_bloc.dart';
import 'package:lockers_app_blocs/components/ceff_elevated_button.dart';
import 'package:lockers_app_blocs/screens/core/widgets/drop_down_menu.dart';

class LockerUpdate extends StatefulWidget {
  const LockerUpdate(
      {super.key,
      required this.locker,
      this.showUpdateForm,
      this.updateSearchLockerList});

  final Function()? showUpdateForm;
  final Locker locker;
  final Function()? updateSearchLockerList;

  @override
  State<LockerUpdate> createState() => _LockerUpdateState();
}

class _LockerUpdateState extends State<LockerUpdate> {
  // Tools for update locker
  late final TextEditingController lockNumberController =
      TextEditingController(text: widget.locker.lockNumber.toString());
  late final TextEditingController lockerNumberController =
      TextEditingController(text: widget.locker.lockerNumber.toString());
  late final TextEditingController nbKeyController =
      TextEditingController(text: widget.locker.nbKey.toString());
  late final TextEditingController floorController =
      TextEditingController(text: widget.locker.floor.toString());
  late final TextEditingController jobController =
      TextEditingController(text: widget.locker.job);
  late final TextEditingController remarkController =
      TextEditingController(text: widget.locker.remark);

  // Tools for locker details
  // late Student student;

  // Form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // if (widget.locker.isAvailable == false &&
    //     widget.locker.isInaccessible == false) {
    //   student = Provider.of<LockerStudentProvider>(context)
    //       .getStudentByLocker(widget.locker);
    // }

    return Padding(
      padding: const EdgeInsets.only(
        left: 100,
        right: 100,
        bottom: 20,
      ),
      child: BlocListener<UpdateLockerBloc, UpdateLockerState>(
        listener: (context, state) {
          if (state is UpdateLockerSuccess) {
            context.read<GetLockersBloc>().add(GetLockers());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "Le casier n°${widget.locker.lockerNumber}  a été modifié avec succès !"),
                duration: const Duration(seconds: 3),
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
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        readOnly: true,
                        enabled: !widget.locker.isInaccessible!,
                        controller: lockerNumberController,
                        decoration: const InputDecoration(
                          labelText: "N° de casier",
                          prefixIcon: Icon(Icons.lock_outlined),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        readOnly: true,
                        enabled: !widget.locker.isInaccessible!,
                        controller: lockNumberController,
                        decoration: const InputDecoration(
                          labelText: "N° de serrure",
                          prefixIcon: Icon(Icons.numbers_outlined),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: DropDownMenu(
                        items: const {
                          "b": "Étage B",
                          "c": "Étage C",
                          "d": "Étage D",
                          "e": "Étage E",
                        },
                        enabled: !widget.locker.isInaccessible!,
                        defaultItem: "Étage...",
                        icon: Icons.location_on_outlined,
                        onChanged: (value) {
                          setState(() {
                            floorController.text = value!;
                          });
                        },
                        defaultChoosedItem: floorController.text,
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
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        enabled: !widget.locker.isInaccessible!,
                        controller: nbKeyController,
                        decoration: const InputDecoration(
                          labelText: "Nombre de clés",
                          prefixIcon: Icon(Icons.key_outlined),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                        enabled: !widget.locker.isInaccessible!,
                        controller: jobController,
                        decoration: const InputDecoration(
                          labelText: "Métier",
                          prefixIcon: Icon(Icons.work_outlined),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        enabled: !widget.locker.isInaccessible!,
                        controller: remarkController,
                        decoration: const InputDecoration(
                          labelText: "Remarque (facultatif)",
                          prefixIcon: Icon(Icons.note_outlined),
                        ),
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
                        onPressed: widget.locker.isInaccessible == true
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
                        onPressed: widget.locker.isInaccessible == true
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  Locker locker = widget.locker.copyWith(
                                    lockerNumber:
                                        int.parse(lockerNumberController.text),
                                    lockNumber:
                                        int.parse(lockNumberController.text),
                                    nbKey: int.parse(nbKeyController.text),
                                    floor: floorController.text,
                                    job: jobController.text,
                                    remark: remarkController.text,
                                    isDefective:
                                        int.parse(nbKeyController.text) != 0 ||
                                                remarkController.text == ""
                                            ? false
                                            : true,
                                  );

                                  context
                                      .read<UpdateLockerBloc>()
                                      .add(UpdateLocker(locker));
                                }
                              },
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              if (widget.locker.isAvailable == false &&
                  widget.locker.isInaccessible == false)
                const Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          readOnly: true,
                          enableInteractiveSelection: false,
                          decoration: InputDecoration(
                            // hintText: "${student.firstName} ${student.lastName}",
                            prefixIcon: Icon(Icons.people_alt_outlined),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          readOnly: true,
                          enableInteractiveSelection: false,
                          decoration: InputDecoration(
                            // hintText: student.job,
                            prefixIcon: const Icon(Icons.work_outlined),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          readOnly: true,
                          enableInteractiveSelection: false,
                          decoration: InputDecoration(
                            // hintText: "Caution de ${student.caution} CHF",
                            prefixIcon:
                                const Icon(Icons.monetization_on_outlined),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
