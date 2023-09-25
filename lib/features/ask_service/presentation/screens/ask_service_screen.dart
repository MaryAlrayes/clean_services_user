import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/bloc/bloc/step4_bloc.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/dialog/confirm_exitting.dart';
import '../../../laundries/data/laundry.dart';
import '../../data/user_coords_impl.dart';
import '../bloc/bloc/step1_bloc.dart';
import '../bloc/bloc/step2_bloc.dart';
import '../bloc/cubit/coords_cubit.dart';
import '../bloc/cubit/stepper_cubit.dart';
import 'ask_service_stepper.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AskServiceScreen extends StatefulWidget {
  static const routeName = 'ask_service_screen';

  final Laundry laundry;
  const AskServiceScreen({
    Key? key,
    required this.laundry,
  }) : super(key: key);

  @override
  State<AskServiceScreen> createState() => _AskServiceScreenState();
}

class _AskServiceScreenState extends State<AskServiceScreen> {
  var _activeCurrentStep = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StepperCubit(maxStep: 4),
        ),
        BlocProvider(
          create: (context) => CoordsCubit(
            userCoords: UserCoordsLocationImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => Step1Bloc(),
        ),
        BlocProvider(
          create: (context) => Step2Bloc(),
        ),
        BlocProvider(
          create: (context) => Step4Bloc(),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          final shouldPop = await showConfirmExitDialog(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
          appBar: AppBar(
            title:  Text('${AppLocalizations.of(context)!.ask_service} ${widget.laundry.name}'),
          ),
          body: AskServiceStepper(
            laundry: widget. laundry,
          ),

        ),
      ),
    );
  }

  Future<bool?> showConfirmExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (dialogContext) => showExitDialog(context),
    );
  }
}
