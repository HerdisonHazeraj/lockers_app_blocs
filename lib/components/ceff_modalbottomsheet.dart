import 'package:flutter/material.dart';

class CEFFModalBottomSheet extends StatefulWidget {
  const CEFFModalBottomSheet(
    this.title, {
    this.text,
    this.standardChildren,
    this.customChildren,
    super.key,
  });

  final String title;
  final String? text;
  final List<Widget>? standardChildren;
  final List<Widget>? customChildren;

  @override
  State<CEFFModalBottomSheet> createState() => _CEFFModalBottomSheetState();
}

class _CEFFModalBottomSheetState extends State<CEFFModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      onClosing: () {},
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 34,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.text != null || widget.text == ""
                          ? Text(
                              widget.text!,
                              style: const TextStyle(fontSize: 16),
                            )
                          : const SizedBox(height: 0, width: 0),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: widget.standardChildren ?? [],
                        ),
                      ),
                      widget.text == null || widget.text == ""
                          ? Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                children: widget.customChildren ?? [],
                              ),
                            )
                          : const SizedBox(height: 0, width: 0),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
