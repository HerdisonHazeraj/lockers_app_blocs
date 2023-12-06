import 'package:flutter/material.dart';
import 'package:lockers_app_blocs/components/ceff_expansionpanel_list.dart';
import 'package:lockers_app_blocs/components/ceff_list_tile.dart';

class CEFFHistory extends StatefulWidget {
  const CEFFHistory(
    this.header,
    this.titleList, {
    this.height = 400,
    this.width = 300,
    this.subtitleList,
    this.trailingList,
    this.isTrailingListVisible = false,
    super.key,
  });

  final Widget header;
  final double height;
  final double width;
  final bool isTrailingListVisible;
  final List<String> titleList;
  final List? subtitleList;
  final List<Widget>? trailingList;

  @override
  State<CEFFHistory> createState() => _CEFFHistoryState();
}

class _CEFFHistoryState extends State<CEFFHistory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: CEFFExpansionPanelList(
        Column(
          children: [
            ...List.generate(
              widget.titleList.length,
              (index) => MouseRegion(
                child: CEFFListTile(
                  widget.titleList[index],
                  subTitle: widget.subtitleList == null
                      ? ""
                      : widget.subtitleList?[index],
                  trailing: Visibility(
                    visible: widget.isTrailingListVisible,
                    // history.isFocus,
                    child: widget.trailingList == null
                        ? const Text('')
                        : widget.trailingList![index],
                  ),
                ),
              ),
            )
          ],
        ),
        widget.header,
      ),
    );
  }
}
