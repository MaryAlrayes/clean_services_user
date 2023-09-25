
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../laundries/data/basic_service.dart';


class ServiceCheckBoxItem extends StatefulWidget {
  final BasicService basicService;
  final bool isChecked;
  final Function onChangedHandler;
  const ServiceCheckBoxItem({
    Key? key,
    required this.basicService,
    required this.isChecked,
    required this.onChangedHandler,
  }) : super(key: key);

  @override
  State<ServiceCheckBoxItem> createState() => _ServiceCheckBoxItemState();
}

class _ServiceCheckBoxItemState extends State<ServiceCheckBoxItem> {
  late bool checkedValue;
  @override
  void initState() {
    super.initState();
    checkedValue = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          onChanged: (value) {
            setState(() {
              checkedValue = !checkedValue;
            });

            widget.onChangedHandler(value);
          },
          value: checkedValue,
        ),
        Text(
          '${widget.basicService.service} - ${AppLocalizations.of(context)!.price} (${widget.basicService.price})',
        ),
      ],
    );
  }
}
