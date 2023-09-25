import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services/core/utils/enums/enums.dart';

part 'drawer_navigation_state.dart';

class DrawerNavigationCubit extends Cubit<DrawerNavigationState> {
  DrawerNavigationCubit()
      : super(const DrawerNavigationState(
            navigationDrawer: NavigationLabelsDrawer.laundries));
  void getDrawerItem(NavigationLabelsDrawer navigationDrawer) {
    switch (navigationDrawer) {
      case NavigationLabelsDrawer.laundries:
        emit(
          const DrawerNavigationState(navigationDrawer: NavigationLabelsDrawer.laundries),
        );
        break;
      case NavigationLabelsDrawer.favorite:
        emit(
          const DrawerNavigationState(
              navigationDrawer: NavigationLabelsDrawer.favorite),
        );
        break;
      case NavigationLabelsDrawer.myOrder:
        emit(
          const DrawerNavigationState(
              navigationDrawer: NavigationLabelsDrawer.myOrder),
        );
        break;
      case NavigationLabelsDrawer.ordersLog:
        emit(
          const DrawerNavigationState(
              navigationDrawer: NavigationLabelsDrawer.ordersLog),
        );
        break;
      case NavigationLabelsDrawer.settings:
        emit(
          const DrawerNavigationState(
              navigationDrawer: NavigationLabelsDrawer.settings),
        );
        break;
      case NavigationLabelsDrawer.termsConditions:
        emit(
          const DrawerNavigationState(
              navigationDrawer: NavigationLabelsDrawer.termsConditions),
        );
        break;
      case NavigationLabelsDrawer.systemMethod:
        emit(
          const DrawerNavigationState(
              navigationDrawer: NavigationLabelsDrawer.systemMethod),
        );
        break;
    }
  }
}
