import 'package:flutter/material.dart';

class CEFFSearchBar extends StatefulWidget {
  const CEFFSearchBar(
    this.researchFunction, {
    super.key,
    this.onTap,
    this.isFullScreen = true,
  });

  final Function(String research) researchFunction;
  final VoidCallback? onTap;
  final bool isFullScreen;

  @override
  State<CEFFSearchBar> createState() => _CEFFSearchBarState();
}

class _CEFFSearchBarState extends State<CEFFSearchBar> {
  @override
  Widget build(BuildContext context) {
    List searchedList = [];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: SearchAnchor(
        isFullScreen: widget.isFullScreen,
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
          searchedList = widget.researchFunction(controller.text);
          return List<ListTile>.from(
            searchedList.map(
              (item) {
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    widget.onTap;
                  },
                );
              },
            ),
          );
        },
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xffF4F6F7)),
            elevation: MaterialStateProperty.all(0),
            controller: controller,
            onChanged: (value) {
              controller.openView();
            },
            onTap: () {
              controller.openView();
            },
            leading: const Icon(Icons.search),
          );
        },
      ),
    );
  }
}
