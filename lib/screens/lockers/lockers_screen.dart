import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker_repository/user_repository.dart';
import 'package:lockers_app_blocs/blocs/locker/delete_locker_bloc/delete_locker_bloc.dart';
import 'package:lockers_app_blocs/blocs/locker/get_lockers_bloc/get_lockers_bloc.dart';
import 'package:lockers_app_blocs/blocs/locker/update_locker_bloc/update_locker_bloc.dart';
import 'package:lockers_app_blocs/responsive.dart';
import 'package:lockers_app_blocs/screens/lockers/widgets/locker_item.dart';
import 'package:lockers_app_blocs/screens/lockers/widgets/locker_update.dart';
import 'package:lockers_app_blocs/screens/lockers/widgets/lockers_menu.dart';

class LockersScreen extends StatefulWidget {
  const LockersScreen(
    this.lockers, {
    super.key,
  });

  final Map<String, List<Locker>> lockers;

  static String routeName = '/lockers';
  static int pageIndex = 1;

  @override
  State<LockersScreen> createState() => _LockersScreenState();
}

class _LockersScreenState extends State<LockersScreen> {
  late List<bool> isExpFloor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isExpFloor = List.generate(widget.lockers.length, (index) => true);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ExpansionPanelList(
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              isExpFloor[index] = !isExpFloor[index];
                            });
                          },
                          expandedHeaderPadding: const EdgeInsets.all(6.0),
                          animationDuration: const Duration(milliseconds: 500),
                          children: [
                            ...widget.lockers.entries.map(
                              (e) => ExpansionPanel(
                                isExpanded: isExpFloor[widget.lockers.keys
                                    .toList()
                                    .indexOf(e.key)],
                                canTapOnHeader: true,
                                headerBuilder: (context, isExpanded) {
                                  return ListTile(
                                    title: Text(
                                      'Tous les casiers de l\'étage ${e.key.toUpperCase()}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  );
                                },
                                body: Responsive.isDesktop(context)
                                    ? ExpansionPanelList(
                                        expansionCallback:
                                            (int index, bool isExpanded) {
                                          setState(() {
                                            e.value[index].isUpdating =
                                                !e.value[index].isUpdating;
                                          });
                                        },
                                        expandedHeaderPadding:
                                            const EdgeInsets.all(0),
                                        animationDuration:
                                            const Duration(milliseconds: 500),
                                        children: [
                                          ...e.value.map(
                                            (l) => ExpansionPanel(
                                              isExpanded: l.isUpdating,
                                              canTapOnHeader: true,
                                              headerBuilder:
                                                  (context, isExpanded) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(6.0),
                                                  child: BlocProvider(
                                                    create: (context) =>
                                                        DeleteLockerBloc(
                                                      lockerRepository: context
                                                          .read<
                                                              GetLockersBloc>()
                                                          .lockerRepository,
                                                    ),
                                                    child: LockerItem(
                                                      locker: l,
                                                      isLockerInDefectiveList:
                                                          false,
                                                    ),
                                                  ),
                                                );
                                              },

                                              body: l.isUpdating == true
                                                  ? BlocProvider(
                                                      create: (context) =>
                                                          UpdateLockerBloc(
                                                        lockerRepository: context
                                                            .read<
                                                                GetLockersBloc>()
                                                            .lockerRepository,
                                                      ),
                                                      child: LockerUpdate(
                                                        locker: l,
                                                        showUpdateForm: () =>
                                                            setState(() {
                                                          l.isUpdating =
                                                              !l.isUpdating;
                                                        }),
                                                      ),
                                                    )
                                                  : const SizedBox(),
                                              // body: LockerUpdate(
                                              //   locker: l,
                                              //   showUpdateForm: () =>
                                              //       setState(() {
                                              //     // l.isUpdating =
                                              //     //     !l.isUpdating;
                                              //   }),
                                              //   // updateSearchLockerList: () =>
                                              //   //     refreshList(),
                                              // ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 1,
                                        itemBuilder: (context, index) => Column(
                                          children: [
                                            ...e.value.map(
                                              (l) => LockerItem(
                                                locker: l,
                                                isLockerInDefectiveList: false,
                                                // refreshList: () =>
                                                //     refreshList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          LockersMenu(),
        ],
      ),
    );
  }
}
