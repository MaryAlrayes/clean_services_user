import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/managers/assets_manager.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/ui/dialogs/logout_dialog.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../bloc/cubit/drawer_navigation_cubit.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeaderDrawer(),
          _getLaundryItem(context),
          _getFavoriteItem(context),
          _getOrdersItem(context),
          _getLogItem(context),
          const Divider(
            height: 2,
          ),
          _getSettingsItem(context),
          _getTermsConditionsItem(context),
          _getSystemMethodItem(context),
          const Divider(
            height: 2,
          ),
          _getLogOutItem(context)
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _buildHeaderDrawer() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage(
              AssetsManager.background,
            ),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.dstATop),
            fit: BoxFit.cover),
      ),
      accountName: Text(
        '',
        style: getRegularStyle(color: Colors.black, fontSize: FontSize.s16),
      ),
      accountEmail: Text('اسم المستخدم',
          style: getRegularStyle(color: Colors.black, fontSize: FontSize.s16)),
    );
  }

  Widget _getLogOutItem(BuildContext context) {
    return DrawerItem(
      handler: () {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return showLogOutDialog(context);
          },
        );
      },
      iconData: Icons.logout,
      title: AppLocalizations.of(context)!.logout_nav,
    );
  }

  Widget _getSystemMethodItem(BuildContext context) {
    return DrawerItem(
      iconData: Icons.work_history,
      title: AppLocalizations.of(context)!.how_system_works_nav,
      handler: () {
        Navigator.pop(context);
        BlocProvider.of<DrawerNavigationCubit>(context)
            .getDrawerItem(NavigationLabelsDrawer.systemMethod);
      },
    );
  }

  Widget _getTermsConditionsItem(BuildContext context) {
    return DrawerItem(
      iconData: Icons.description,
      title: AppLocalizations.of(context)!.terms_conditions_nav,
      handler: () {
        Navigator.pop(context);
        BlocProvider.of<DrawerNavigationCubit>(context)
            .getDrawerItem(NavigationLabelsDrawer.termsConditions);
      },
    );
  }

  Widget _getSettingsItem(BuildContext context) {
    return DrawerItem(
      iconData: Icons.settings,
      title: AppLocalizations.of(context)!.settings_nav,
      handler: () {
        Navigator.pop(context);
        BlocProvider.of<DrawerNavigationCubit>(context)
            .getDrawerItem(NavigationLabelsDrawer.settings);
      },
    );
  }

  Widget _getLogItem(BuildContext context) {
    return DrawerItem(
      iconData: Icons.history,
      title: AppLocalizations.of(context)!.log_orders_nav,
      handler: () {
        Navigator.pop(context);
        BlocProvider.of<DrawerNavigationCubit>(context)
            .getDrawerItem(NavigationLabelsDrawer.ordersLog);
      },
    );
  }

  Widget _getOrdersItem(BuildContext context) {
    return DrawerItem(
      iconData: Icons.spatial_tracking_sharp,
      title: AppLocalizations.of(context)!.my_orders_nav,
      handler: () {
        Navigator.pop(context);
        BlocProvider.of<DrawerNavigationCubit>(context)
            .getDrawerItem(NavigationLabelsDrawer.myOrder);
      },
    );
  }

  Widget _getFavoriteItem(BuildContext context) {
    return DrawerItem(
      iconData: Icons.favorite,
      title: AppLocalizations.of(context)!.favorites_nav,
      handler: () {
        Navigator.pop(context);
        BlocProvider.of<DrawerNavigationCubit>(context)
            .getDrawerItem(NavigationLabelsDrawer.favorite);
      },
    );
  }

  Widget _getLaundryItem(BuildContext context) {
    return DrawerItem(
      iconData: Icons.local_laundry_service_outlined,
      title: AppLocalizations.of(context)!.laundries_nav,
      handler: () {
        Navigator.pop(context);
        BlocProvider.of<DrawerNavigationCubit>(context)
            .getDrawerItem(NavigationLabelsDrawer.laundries);
      },
    );
  }
}
