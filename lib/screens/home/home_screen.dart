import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker_repository/user_repository.dart';
import 'package:lockers_app_blocs/blocs/locker/get_lockers_bloc/get_lockers_bloc.dart';
import 'package:lockers_app_blocs/blocs/user/my_user_bloc/my_user_bloc.dart';
import 'package:lockers_app_blocs/screens/core/components/side_menu_app.dart';
import 'package:lockers_app_blocs/screens/dashboard/dashboard_screen.dart';
import 'package:lockers_app_blocs/screens/loading_page.dart';
import 'package:lockers_app_blocs/screens/lockers/lockers_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SideMenuController sideMenuController = SideMenuController();
  final PageController pageController = PageController();

  @override
  void initState() {
    sideMenuController.addListener((index) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenuApp(sideMenuController: sideMenuController),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                BlocBuilder<MyUserBloc, MyUserState>(
                  builder: (context, state) {
                    if (state.status == MyUserStatus.success) {
                      return DashboardScreen(
                        myUser: state.user!,
                      );
                    } else if (state.status == MyUserStatus.loading) {
                      return const LoadingPage();
                    } else {
                      return const Center(
                          child: Text("Une erreur est survenue."));
                    }
                  },
                ),
                BlocBuilder<GetLockersBloc, GetLockersState>(
                  builder: (context, state) {
                    if (state is GetLockersSuccess) {
                      Map<String, List<Locker>> lockersByFloor = {};

                      lockersByFloor['d'] = state.lockers
                          .where((element) => element.floor == 'd')
                          .toList();
                      lockersByFloor['c'] = state.lockers
                          .where((element) => element.floor == 'c')
                          .toList();
                      lockersByFloor['b'] = state.lockers
                          .where((element) => element.floor == 'b')
                          .toList();
                      lockersByFloor['e'] = state.lockers
                          .where((element) => element.floor == 'e')
                          .toList();

                      return LockersScreen(lockersByFloor);
                    } else if (state is GetLockersLoading) {
                      return const LoadingPage();
                    } else {
                      return const Center(
                          child: Text("Une erreur est survenue."));
                    }
                  },
                ),
                // const HistoricDashboardScreen(),
                // const ImportAllScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
