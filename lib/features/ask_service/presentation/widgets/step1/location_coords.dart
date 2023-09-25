import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/bloc/bloc/step1_bloc.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/bloc/cubit/coords_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationCoords extends StatelessWidget {
  const LocationCoords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CoordsCubit, CoordsState>(
      listener: (context, state) {
        if (state is CoordsFetched) {
          BlocProvider.of<Step1Bloc>(context).add(
            CoordsChangedEvent(
              lat: state.coords.lat.toDouble(),
              lng: state.coords.lng.toDouble(),
            ),
          );
        }
      },
      child: BlocBuilder<CoordsCubit, CoordsState>(
        builder: (context, state) {
          if (state is CoordsInitial) {
            return _buildInitial(context);
          }
          if (state is CoordsLoading) {
            return _buildLoading(context);
          } else if (state is CoordsFetched) {
            return _buildFetched(context);
          } else if (state is CoordsError) {
            return _buildError(context);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Column _buildError(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.error_fetching_coords),
        OutlinedButton.icon(
          icon: const Icon(Icons.replay_outlined),
          onPressed: () {
            BlocProvider.of<CoordsCubit>(context).fetchLocation();
          },
          label: Text(
            AppLocalizations.of(context)!.retry,
          ),
        )
      ],
    );
  }

  Row _buildFetched(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(AppLocalizations.of(context)!.coords_has_been_fetched)
      ],
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.fetch_coords_loading,
        ),
        const SizedBox(
          height: 8,
        ),
        const CircularProgressIndicator(),
      ],
    );
  }

  Column _buildInitial(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.taking_coords_when_click,
        ),
        OutlinedButton(
          onPressed: () {
            BlocProvider.of<CoordsCubit>(context).fetchLocation();
          },
          child: Text(
            AppLocalizations.of(context)!.fetch_coords,
          ),
        )
      ],
    );
  }
}
