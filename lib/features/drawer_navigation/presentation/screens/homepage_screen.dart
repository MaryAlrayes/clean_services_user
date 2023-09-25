import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums/enums.dart';
import '../../../conditions_terms/presentation/screens/terms_conditions_screen.dart';
import '../../../favorites/presentation/screens/favorites_screen.dart';
import '../../../laundries/presentation/screens/laundries_screen.dart';
import '../../../orders/presentation/screens/orders_screen.dart';
import '../../../orders_log/presentation/screens/orders_log_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
import '../../../system_method/presentation/screens/system_method.dart';
import '../../bloc/cubit/drawer_navigation_cubit.dart';
import '../widgets/custom_drawer.dart';

class HomepagScreen extends StatelessWidget {
  static const routeName = 'homepage_screen';
  const HomepagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: BlocBuilder<DrawerNavigationCubit, DrawerNavigationState>(
        builder: (context, state) {
          switch (state.navigationDrawer) {
            case NavigationLabelsDrawer.laundries:
              return const LaundriesScreen();
            case NavigationLabelsDrawer.favorite:
              return const FavoritesScreen();
            case NavigationLabelsDrawer.myOrder:
              return const OrdersScreen();
            case NavigationLabelsDrawer.ordersLog:
              return const OrdersLogScreen();
            case NavigationLabelsDrawer.settings:
              return const SettingsScreen();
            case NavigationLabelsDrawer.termsConditions:
              return const TermsConditionsScreen();
            case NavigationLabelsDrawer.systemMethod:
              return const SystemMethod();
          }
        },
      ),
    );
  }
}
