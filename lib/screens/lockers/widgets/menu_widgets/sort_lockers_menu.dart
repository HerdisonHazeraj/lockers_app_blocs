import 'package:flutter/material.dart';
import 'package:lockers_app_blocs/components/ceff_dropdown_field.dart';

// ignore: must_be_immutable
class SortLockersMenu extends StatefulWidget {
  const SortLockersMenu({
    super.key,
  });

  @override
  State<SortLockersMenu> createState() => _SortLockersMenuState();
}

class _SortLockersMenuState extends State<SortLockersMenu> {
  List selectednbrClefsFromMap = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 80.0, left: 10, top: 10.0),
      child: Wrap(
        children: [
          CEFFDropdownField(
            "Nombre de Clés...",
            const {'0': '0', '1': '1', '2': '2', '3': '3', '4': '4'},
            icon: Icons.key_outlined,
            onChanged: (value) {},
            enabled: true,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, left: 10.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black54),
                ),
                onPressed: () {},
                child: const Text('Appliquer'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
