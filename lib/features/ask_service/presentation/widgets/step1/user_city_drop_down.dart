import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services/core/managers/color_manager.dart';
import 'package:saudi_clean_services/core/managers/styles_manager.dart';
import 'package:saudi_clean_services/core/managers/values_manager.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/bloc/bloc/step1_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class UserCityDropDown extends StatefulWidget {
  const UserCityDropDown({super.key});

  @override
  State<UserCityDropDown> createState() => _UserCityDropDownState();
}

class _UserCityDropDownState extends State<UserCityDropDown> {
  String? selected;
  final List<String> locations = ['موقع 1', 'موقع 2', 'موقع 3'];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
         border: Border.all(color: ColorManager.grey),


        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
      child: BlocBuilder<Step1Bloc, Step1State>(
        builder: (context, state) {
          return DropdownButtonHideUnderline(
            child: ButtonTheme(
              child: DropdownButton<String>(
                value: state.city == '' ? selected : state.city,
                hint:  Text(AppLocalizations.of(context)!.choose_city),
                items: locations
                    .map((e) => _buildDropMenuItem(context, e))
                    .toList(),
                onChanged: ((value) {
                  BlocProvider.of<Step1Bloc>(context)
                      .add(CityChangedEvent(city: value!));
                  setState(() {
                    selected = value;
                  });
                }),
              ),
            ),
          );
        },
      ),
    );
  }

  DropdownMenuItem<String> _buildDropMenuItem(BuildContext context, String e) {
    return DropdownMenuItem(
      value: e,
      child: Text(
        e,
        style: getRegularStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
