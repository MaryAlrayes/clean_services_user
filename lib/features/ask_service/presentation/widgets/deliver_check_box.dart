import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DeliverCheckBox extends StatefulWidget {
  const DeliverCheckBox({super.key});

  @override
  State<DeliverCheckBox> createState() => _DeliverCheckBoxState();
}

class _DeliverCheckBoxState extends State<DeliverCheckBox> {
  bool selectedValue = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = !selectedValue;
            });
          },
        ),
         Flexible(
          child: Text(
           AppLocalizations.of(context)!.delivery_type,
          ),
        )
      ],
    );
  }
}
