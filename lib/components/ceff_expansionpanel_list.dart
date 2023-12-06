import 'package:flutter/material.dart';

class CEFFExpansionPanelList extends StatefulWidget {
  const CEFFExpansionPanelList(
    this.body,
    this.header, {
    this.canTapOnHeader = false,
    this.expandedHeaderPadding = 6,
    this.backgroundColor = Colors.white,
    this.animationDuration = 600,
    super.key,
  });
  final Widget body;
  final Color backgroundColor;
  final bool canTapOnHeader;
  final double expandedHeaderPadding;
  final int animationDuration;
  final Widget header;

  @override
  State<CEFFExpansionPanelList> createState() => _CEFFExpansionPanelListState();
}

class _CEFFExpansionPanelListState extends State<CEFFExpansionPanelList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          elevation: 0,
          expandedHeaderPadding: EdgeInsets.all(widget.expandedHeaderPadding),
          animationDuration: Duration(milliseconds: widget.animationDuration),
          children: [
            ExpansionPanel(
              backgroundColor: widget.backgroundColor,
              isExpanded: _isExpanded,
              canTapOnHeader: widget.canTapOnHeader,
              headerBuilder: (context, isExpanded) {
                return widget.header;
              },
              body: widget.body,
            ),
          ],
        ),
      ),
    );
  }
}
