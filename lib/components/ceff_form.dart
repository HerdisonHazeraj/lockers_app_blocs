import 'package:flutter/material.dart';
import 'package:lockers_app_blocs/components/ceff_elevated_button.dart';
import 'package:lockers_app_blocs/components/ceff_titlemenu_text.dart';

class CEFFForm extends StatefulWidget {
  const CEFFForm(
    this.fields,
    this.text,
    this.boutonText, {
    this.titleFontSize = 18,
    this.onSubmit,
    this.padding = 20,
    this.horizontalSpacing = 10,
    this.verticalSpacing = 10,
    this.crossAxisCount = 2,
    super.key,
  });

  final List<Widget>? fields;
  final String text;
  final double titleFontSize;
  final String boutonText;
  final double padding;
  final VoidCallback? onSubmit;
  final double horizontalSpacing;
  final double verticalSpacing;
  final int crossAxisCount;

  @override
  State<CEFFForm> createState() => _CEFFFormState();
}

class _CEFFFormState extends State<CEFFForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CEFFTitleMenuText(
            widget.text,
            fontSize: widget.titleFontSize,
          ),
          widget.fields != null
              ? Expanded(
                  child: GridView.count(
                    childAspectRatio: 4,
                    crossAxisSpacing: widget.horizontalSpacing,
                    mainAxisSpacing: widget.verticalSpacing,
                    crossAxisCount: widget.crossAxisCount,
                    children: widget.fields!,
                  ),
                )
              : const Expanded(
                  child: Center(
                    child: Text("Ce formulaire est vide !"),
                  ),
                ),
          CEFFElevatedButton(
            widget.boutonText,
            onPressed: widget.onSubmit,
          ),
        ],
      ),
    );
  }
}
