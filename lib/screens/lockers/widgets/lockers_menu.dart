import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker_repository/locker_repository.dart';
import 'package:lockers_app_blocs/blocs/locker/create_locker_bloc/create_locker_bloc.dart';
import 'package:lockers_app_blocs/blocs/locker/get_lockers_bloc/get_lockers_bloc.dart';
import 'package:lockers_app_blocs/components/ceff_divider.dart';
import 'package:lockers_app_blocs/screens/lockers/widgets/menu_widgets/add_locker_menu.dart';
import 'package:lockers_app_blocs/screens/lockers/widgets/menu_widgets/import_locker_menu.dart';
import 'package:lockers_app_blocs/screens/lockers/widgets/menu_widgets/search_locker_menu.dart';

class LockersMenu extends StatefulWidget {
  const LockersMenu({
    // required this.searchLockers,
    super.key,
  });

  // final Function(String value) searchLockers;

  @override
  State<LockersMenu> createState() => _LockersMenuState();
}

class _LockersMenuState extends State<LockersMenu> {
  // List of lockers searched
  List<Locker> searchedLockers = [];

  List<List> values = [];
  List<List> keys = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color(0xffececf6),
            border: Border(
              left: BorderSide(width: 0.3, color: Colors.black54),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 30,
            ),
            child: Column(
              children: [
                const SearchLockerMenu(
                    // searchLockers: (value) => widget.searchLockers(value),
                    ),
                const CEFFDivider(),
                BlocProvider(
                  create: (context) => CreateLockerBloc(
                    lockerRepository:
                        context.read<GetLockersBloc>().lockerRepository,
                  ),
                  child: const AddLockerMenu(),
                ),
                const CEFFDivider(),
                ImportLockerMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
