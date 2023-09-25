import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/managers/color_manager.dart';
import 'package:saudi_clean_services/core/ui/widgets/background.dart';
import 'package:saudi_clean_services/core/ui/widgets/custom_text_field.dart';
import 'package:saudi_clean_services/core/ui/widgets/custom_label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_clean_services/features/auth/signup/presentation/widgets/location_drop_down.dart';

class ChangePersonalInfoScreen extends StatelessWidget {
  static const routeName = 'change_personal_info_screen';
  ChangePersonalInfoScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
           AppLocalizations.of(context)!.change_personal_info,
        ),
      ),
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildNameField(context),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildPhoneField(context),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildLocation(context),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildBtns(context)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNameField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(text: AppLocalizations.of(context)!.user_name),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 60,
          child: CustomTextField(
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.text,
              hintText: AppLocalizations.of(context)!.user_name,
              iconData: (Icons.person),
              validator: (String? value) {},
              isObscure: false),
        ),
      ],
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(text: AppLocalizations.of(context)!.phone_number),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 60,
          child: CustomTextField(
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.phone,
              hintText: AppLocalizations.of(context)!.phone_number,
              iconData: (Icons.phone),
              validator: (String? value) {},
              isObscure: false),
        ),
      ],
    );
  }

  Widget _buildLocation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomLabel(text: AppLocalizations.of(context)!.user_location),
        const SizedBox(
          height: 4,
        ),
        const LocationDropDown(),
      ],
    );
  }

  Widget _buildBtns(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: Text(AppLocalizations.of(context)!.done),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.grey1,
            foregroundColor: Colors.white,
          ),
          child: Text(
            AppLocalizations.of(context)!.cancel,
          ),
        ),
      ],
    );
  }
}
