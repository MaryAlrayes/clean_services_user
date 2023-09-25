import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/utils/enums/enums.dart';
import 'package:saudi_clean_services/core/utils/extensions/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 3,
            width: 35,
            color: Colors.grey,
            alignment: Alignment.center,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildLabel(context),
            ...(LaundryFilter.values).map(
              (element) {
                return InkWell(
                  // highlightColor: Colors.green,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      // color: element.isSelected ? Colors.green : Colors.white,
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.grey.shade200),
                      ),
                    ),
                    child: Text(
                      element.displayText(context),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        // color:
                        //     element.isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ).toList()
          ],
        ),
      ],
    );
  }

  Container _buildLabel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        AppLocalizations.of(context)!.order_by,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
