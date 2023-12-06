import 'package:flutter/material.dart';
import 'package:lockers_app_blocs/components/ceff_text_field.dart';
import 'package:lockers_app_blocs/components/ceff_titlemenu_text.dart';

class SearchLockerMenu extends StatefulWidget {
  const SearchLockerMenu({
    super.key,
    // required this.searchLockers,
  });

  // final Function(String value) searchLockers;

  @override
  State<SearchLockerMenu> createState() => _SearchLockerMenuState();
}

class _SearchLockerMenuState extends State<SearchLockerMenu> {
  @override
  Widget build(BuildContext context) {
    return const ListBody(
      children: [
        SizedBox(
          width: double.infinity,
          child: CEFFTitleMenuText(
            "Rechercher un casier",
          ),
        ),
        CEFFTextField(
          "Rechercher...",
          Icon(Icons.search_rounded),
          // onChanged: (value) => widget.searchLockers(value),
        ),
      ],
    );
  }
}
