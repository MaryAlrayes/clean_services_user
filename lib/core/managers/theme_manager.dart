import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saudi_clean_services/core/managers/color_manager.dart';
import 'package:saudi_clean_services/core/managers/font_manager.dart';
import 'package:saudi_clean_services/core/managers/styles_manager.dart';
import 'package:saudi_clean_services/core/managers/values_manager.dart';

ThemeData getApplicationThemeData() {
  return ThemeData(
    fontFamily: FontConstants.cairoFontFamily,

    //main Colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,


    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
       systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.primary,
        
      ),
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s18,
        color: ColorManager.white,
      ),
    ),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

//elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s14,
        ),
        padding: const EdgeInsets.all(
          AppPadding.p8,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s4),
        ),
      ),
    ),

    // text theme
    // textTheme: TextTheme(

    //   displayLarge:
    //       getLightStyle(color: ColorManager.white, fontSize: FontSize.s22),
    //   headline1: getSemiBoldStyle(
    //       color: ColorManager.darkGrey, fontSize: FontSize.s16),
    //   subtitle1:
    //       getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
    //   caption: getRegularStyle(color: ColorManager.grey1),
    //   bodyText1        : getRegularStyle(
    //     color: ColorManager.grey,
    //   ),
    // ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
        horizontal: 16.0,
      ),

      // hint style
      hintStyle: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s16,
      ),
      labelStyle: getMediumStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      errorStyle: getRegularStyle(
        color: ColorManager.error,
      ),

      // enabled border style (grey)
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey.withOpacity(1),
          //  width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),

      // focused border style(primary)
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary.withOpacity(1),
          //  width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),

      // error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          //  width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),

      // focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          // width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
    ),
  );
}
