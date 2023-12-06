import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker_repository/user_repository.dart';
import 'package:lockers_app_blocs/blocs/locker/create_locker_bloc/create_locker_bloc.dart';
import 'package:lockers_app_blocs/blocs/locker/get_lockers_bloc/get_lockers_bloc.dart';
import 'package:lockers_app_blocs/screens/core/widgets/drop_down_menu.dart';

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
          child: Text(
            "Ajouter un casier",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ),
        BlocListener<CreateLockerBloc, CreateLockerState>(
          listener: (context, state) {
            if (state is CreateLockerSuccess) {
              context.read<GetLockersBloc>().add(GetLockers());
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
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez remplir ce champ';
                              }
                              return null;
                            },
                            focusNode: focusLockerNumber,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context).requestFocus(focusNbKey);
                            },
                            controller: lockerNumberController,
                            decoration: const InputDecoration(
                              labelText: "N° de casier",
                              prefixIcon: Icon(Icons.lock_outlined),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez remplir ce champ';
                              }
                              return null;
                            },
                            focusNode: focusLockNumber,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context).requestFocus(focusJob);
                            },
                            controller: lockNumberController,
                            decoration: const InputDecoration(
                              labelText: "N° de serrure",
                              prefixIcon: Icon(Icons.numbers_outlined),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          DropDownMenu(
                            items: const {
                              "b": "Étage B",
                              "c": "Étage C",
                              "d": "Étage D",
                              "e": "Étage E",
                            },
                            focus: focusFloor,
                            nextFocus: focusRemark,
                            enabled: true,
                            defaultItem: "Étage...",
                            icon: Icons.calendar_today_outlined,
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
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez remplir ce champ';
                              }
                              return null;
                            },
                            focusNode: focusNbKey,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context)
                                  .requestFocus(focusLockNumber);
                            },
                            controller: nbKeyController,
                            decoration: const InputDecoration(
                              labelText: "Nombre de clés",
                              prefixIcon: Icon(Icons.key_outlined),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez remplir ce champ';
                              }
                              return null;
                            },
                            focusNode: focusJob,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context).requestFocus(focusFloor);
                            },
                            controller: jobController,
                            decoration: const InputDecoration(
                              labelText: "Métier",
                              prefixIcon: Icon(Icons.work_outlined),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          TextFormField(
                            focusNode: focusRemark,
                            textInputAction: TextInputAction.done,
                            controller: remarkController,
                            decoration: const InputDecoration(
                              labelText: "Remarque (facultatif)",
                              prefixIcon: Icon(Icons.note_outlined),
                            ),
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
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black54),
                    ),
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

                        // Provider.of<LockerStudentProvider>(context, listen: false)
                        //     .addLocker(locker);
                        // Provider.of<HistoryProvider>(context, listen: false)
                        //     .addHistory(History(
                        //   date: DateTime.now().toString(),
                        //   action: "add",
                        //   locker: locker.toJson(),
                        // ));

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Le casier n°${locker.lockerNumber} a été ajouté avec succès !'),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    child: const Text("Ajouter"),
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
