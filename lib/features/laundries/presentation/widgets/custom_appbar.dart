import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/managers/assets_manager.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';
import '../../../notifications/presentation/screens/notifications_screen.dart';
import 'filter_btn.dart';

class CustomAppbar extends StatelessWidget {
  final VoidCallback handlerDrawer;
  const CustomAppbar({Key? key, required this.handlerDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.primary,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildDrawerIcon(context),
                      _buildAppName(context),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Row(
                  children: [
                    _buildBadge(context),
                    _buildNotificationIcon(context),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Row(
                children: [
                  Expanded(
                    child: _buildSearchField(
                      context,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const FilterBtn()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconButton _buildDrawerIcon(BuildContext context) {
    return IconButton(
      onPressed: handlerDrawer,
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
    );
  }

  Widget _buildAppName(BuildContext context) {
    return Flexible(
      child: Text(
        AppLocalizations.of(context)!.saudi_clean_services,
        style: getMediumStyle(
          color: Colors.white,
          fontSize: FontSize.s16,
        ),
      ),
    );
  }

  Widget _buildNotificationIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, NotificationsScreen.routeName);
        },
        icon: const Icon(
          Icons.notifications,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return SizedBox(
      height: 50,
      child: CustomTextField(
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.text,
        hintText: AppLocalizations.of(context)!.search,
        iconData: (Icons.search),
        validator: (String? value) {},
        isObscure: false,
      ),
    );
  }

  Widget _buildBadge(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: SvgPicture.asset(
        AssetsManager.gold,
      ),
    );
  }
}
