import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/managers/values_manager.dart';
import 'package:saudi_clean_services/features/laundries/presentation/widgets/filter_sheet.dart';

class FilterBtn extends StatelessWidget {
  const FilterBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
        color: Colors.white,
      ),
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              builder: (context) => const FilterSheet());
        },
        icon: const Icon(Icons.filter_list),
      ),
    );
  }
}
