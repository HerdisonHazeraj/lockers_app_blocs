import 'package:flutter/material.dart';
import 'package:lockers_app_blocs/screens/dashboard/widgets/menu/historic_dashboard_menu.dart';
import 'package:lockers_app_blocs/screens/dashboard/widgets/menu/import_all_menu.dart';

class DashboardMenu extends StatefulWidget {
  const DashboardMenu({super.key});

  @override
  State<DashboardMenu> createState() => _DashboardMenuState();
}

class _DashboardMenuState extends State<DashboardMenu> {
  @override
  void initState() {
    super.initState();

    // initializeDateFormatting("fr");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border(
          left: BorderSide(width: 0.3, color: Theme.of(context).dividerColor),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 30,
        ),
        child: Column(
          children: [
            const HistoricDashboardMenu(),
            // const dividerMenu(),
            ImportAllMenu(),
          ],
        ),
      ),
    );
  }
}
