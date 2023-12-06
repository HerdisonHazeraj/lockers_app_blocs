import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CEFFSlidableList extends StatefulWidget {
  const CEFFSlidableList(
    this.child, {
    this.startItems,
    this.endItems,
    this.endDismissible,
    this.startDismissible,
    this.endMotion = const ScrollMotion(),
    this.startMotion = const ScrollMotion(),
    this.slideDirection = Axis.horizontal,
    super.key,
  });

  final Widget child;
  final List<SlidableAction>? startItems;
  final List<SlidableAction>? endItems;
  final Widget? endDismissible;
  final Widget? startDismissible;
  final Widget endMotion;
  final Widget startMotion;
  final Axis slideDirection;

  @override
  State<CEFFSlidableList> createState() => _CEFFSlidableListState();
}

class _CEFFSlidableListState extends State<CEFFSlidableList> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      direction: widget.slideDirection,
      key: const ValueKey(0),
      endActionPane: widget.endItems != null
          ? ActionPane(
              dismissible: widget.endDismissible,
              motion: widget.endMotion,
              children: widget.endItems!,
            )
          : null,
      startActionPane: widget.startItems != null
          ? ActionPane(
              dismissible: widget.startDismissible,
              motion: widget.startMotion,
              children: widget.startItems!,
            )
          : null,
      child: widget.child,
    );
  }
}
