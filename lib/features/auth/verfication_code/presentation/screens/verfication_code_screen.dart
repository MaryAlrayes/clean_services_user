import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/managers/color_manager.dart';
import 'package:saudi_clean_services/core/managers/font_manager.dart';
import 'package:saudi_clean_services/core/managers/styles_manager.dart';
import 'package:saudi_clean_services/core/managers/values_manager.dart';
import 'package:saudi_clean_services/core/ui/widgets/custom_text_field.dart';
import 'package:saudi_clean_services/features/drawer_navigation/presentation/screens/homepage_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerficationCodeScreen extends StatelessWidget {
  static const routeName = 'verfication_code_screen';
  const VerficationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.verification_step,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.please_enter_verification_code,
                style: getBoldStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(AppLocalizations.of(context)!
                  .code_sent_to_this_number('0534673458')),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.text,
                hintText: '',
                validator: (String? value) {},
                isObscure: false,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.didnot_recieve_code,
                    style: getRegularStyle(
                      color: Colors.black,
                      fontSize: FontSize.s16,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(AppLocalizations.of(context)!.resend),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              _buildBtns(context)
            ],
          ),
        ),
      ),
    );
  }

  Row _buildBtns(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomepagScreen.routeName, (Route route) => false);
            },
            child: Text(
              AppLocalizations.of(context)!.verify,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: Text(
              AppLocalizations.of(context)!.cancel,
            ),
          ),
        ),
      ],
    );
  }
}
