import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/managers/assets_manager.dart';
import '../../../../../core/managers/color_manager.dart';
import '../../../../../core/managers/font_manager.dart';
import '../../../../../core/managers/styles_manager.dart';
import '../../../../../core/managers/values_manager.dart';
import '../../../../../core/ui/widgets/custom_text_field.dart';
import '../../../../../core/utils/helpers/snackbar.dart';
import '../../../../drawer_navigation/presentation/screens/homepage_screen.dart';
import '../../../signup/presentation/screens/signup_screen.dart';
import '../widgets/apple_login_btn.dart';
import '../widgets/gmail_login_btn.dart';
import '../widgets/language_drop_down.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login_screen';
   LoginScreen({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    var heightWidget = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: Container(
        color: ColorManager.primary,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                _buildBackground(heightWidget, context),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildlLanguageSelector(),
                      _buildCard(
                        _buildLoginCard(context),
                      ),
                      _buildCopyRight(context)
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginCard(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(context),
          const SizedBox(
            height: 8,
          ),
          _buildPhoneField(context),
          const SizedBox(
            height: 10,
          ),
          _buildPasswordField(context),
          // _buildForgetPassword(),

          const SizedBox(
            height: 12,
          ),
          _buildSubmitBtn(context),
          _buildOrSection(context),


          // const GmailLoginBtn(),
          //   const GmailLoginBtn(),
          //     const GmailLoginBtn(),
                const GmailLoginBtn(),
          const SizedBox(
            height: 4,
          ),
          const AppleLoginBtn(),

          _buildRegisterBtn(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            AssetsManager.app_logo,
            width: 90,
            height: 90,
          ),
        ),
        FittedBox(
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.app_name,
                style: getBoldStyle(
                  color: Colors.black,
                  fontSize: FontSize.s24,
                ),
              ),
              const SizedBox(width: 4,),
              Text(
                AppLocalizations.of(context)!.saudi,
                style: getBoldStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildForgetPassword() {
  //   return Container(
  //     alignment: Alignment.centerLeft,
  //     child: TextButton(
  //       style: TextButton.styleFrom(
  //         padding: EdgeInsets.zero,
  //         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //       ),
  //       child: Text(
  //         'هل نسيت كلمة المرور؟',
  //       ),
  //       onPressed: () {},
  //     ),
  //   );
  // }

  Row _buildRegisterBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.dont_have_an_account,
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
          child: Text(AppLocalizations.of(context)!.create_account),
          onPressed: () {
            Navigator.pushNamed(context, SignupScreen.routeName);
          },
        )
      ],
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return CustomTextField(
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.phone,
        textEditingController: phoneController,
        hintText: AppLocalizations.of(context)!.phone_number,
        iconData: (Icons.phone),
        validator: (String? value) {
          if (value != null) {
            if (value.isEmpty) {
              return AppLocalizations.of(context)!
                  .you_must_enter_your_phone;
            } else {
              return null;
            }
          }
        },
        isObscure: false);
  }

  Widget _buildPasswordField(BuildContext context) {
    return CustomTextField(
      textEditingController: passwordController,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.text,
        hintText: AppLocalizations.of(context)!.password,
        iconData: (Icons.lock),
        validator: (String? value) {
           if (value != null) {
            if (value.isEmpty) {
              return AppLocalizations.of(context)!
                  .you_must_enter_your_password;
            } else {
              return null;
            }
          }
        },
        isObscure: true);
  }

  Widget _buildSubmitBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
          final isValid = formkey.currentState!.validate();
        if (isValid) {
         if (phoneController.text != '0123456789' ||
              passwordController.text != '0123456789') {
            showSnackbar(context,
                AppLocalizations.of(context)!.phone_or_password_not_correct);
          } else {
             Navigator.pushNamedAndRemoveUntil(
                context,
                HomepagScreen.routeName,
                (route) => false,
              );
          }
        }
      },
      child: Text(AppLocalizations.of(context)!.login),
    );
  }

  Widget _buildCard(Widget content) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m16),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24,
            vertical: AppPadding.p18,
          ),
          child: content,
        ),
      ),
    );
  }

  Widget _buildBackground(double heightWidget, BuildContext context) {
    return SizedBox(
      height: heightWidget,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildlLanguageSelector() {
    return Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: AppMargin.m16),
        child: const LanguageDropDown());
  }

  Widget _buildCopyRight(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text(
        AppLocalizations.of(context)!.copy_right(DateTime.now()),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOrSection(BuildContext context) {
    return Row(children:  [
     const Expanded(
          child: Divider(
        thickness: 1,
      )),
    const  SizedBox(
        width: 4,
      ),
      Text( AppLocalizations.of(context)!.or),
    const  SizedBox(
        width: 4,
      ),
    const  Expanded(
        child: Divider(
          thickness: 1,
        ),
      ),
    ]);
  }
}
