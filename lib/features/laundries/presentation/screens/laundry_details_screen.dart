import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/custom_label.dart';
import '../../../../core/ui/widgets/offer_badge.dart';
import '../../../ask_service/presentation/screens/ask_service_screen.dart';
import '../../data/laundry.dart';
import '../widgets/call_btn.dart';
import '../widgets/laundry_service_table.dart';
import '../widgets/map_btn.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LaundryDetailsScreen extends StatelessWidget {
  static const routeName = 'laundry_details_screen';
  final Laundry laundry;
  const LaundryDetailsScreen({
    Key? key,
    required this.laundry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightWidget = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        32;

    return Scaffold(
      persistentFooterButtons: [_buildAddServiceBtn(context)],
      appBar: AppBar(
        title: Text(laundry.name),
      ),
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Center(
                child: _buildCard(heightWidget, context),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _buildAddServiceBtn(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, AskServiceScreen.routeName,
                  arguments: {'laundry': laundry});
            },
            icon: const Icon(Icons.add),
            label: Text(
                '${AppLocalizations.of(context)!.ask_service} ${laundry.name}'),
          ),
        ),
      ],
    );
  }

  Card _buildCard(double heightWidget, BuildContext context) {
    return Card(
      child: Container(
        constraints: BoxConstraints(
          minHeight: heightWidget,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primary,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.p16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLaundryName(),
                    _buildRate(),
                  ],
                ),
                _buildFavBtn()
              ],
            ),
            const Divider(
              height: 16,
            ),
            _buildPhoneNumber(),
            const Divider(
              height: 16,
            ),
            _buildLocation(),
            if (laundry.hasOffer)
              const Divider(
                color: Color(0xffF0D156),
                thickness: 1,
                height: 16,
              ),
            if (laundry.hasOffer) _buildOffers(context),
            if (laundry.hasOffer)
              const Divider(
                color: Color(0xffF0D156),
                thickness: 1,
                height: 16,
              ),
            if (!laundry.hasOffer)
              const Divider(
                height: 16,
              ),
            _buildServicesDetails(context),
          ],
        ),
      ),
    );
  }

  Icon _buildFavBtn() {
    return const Icon(
      Icons.favorite_border,
      color: Colors.red,
    );
  }

  Text _buildLaundryName() {
    return Text(
      laundry.name,
      style: getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s22,
      ),
    );
  }

  Widget _buildLocation() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  color: ColorManager.secondary,
                ),
                const SizedBox(width: 16,),
                Flexible(
                  child: Text(
                    laundry.location,
                    style: getRegularStyle(
                      color: Colors.black,
                      fontSize: FontSize.s16,
                    ),
                  ),
                )
              ],
            ),
          ),
          MapBtn(lat: laundry.lat, lng: laundry.lng)
        ],
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  color: ColorManager.secondary,
                ),
                const SizedBox(width: 16,),
                Flexible(
                  child: Text(
                    laundry.phone,
                    style: getRegularStyle(
                      color: Colors.black,
                      fontSize: FontSize.s16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CallBtn(
            phone: laundry.phone,
          )
        ],
      ),
    );
  }

  Widget _buildRate() {
    return Row(
      children: [
        RatingBar.builder(
          itemBuilder: (context, index) {
            return const Icon(
              Icons.star_rounded,
              color: Colors.amber,
            );
          },
          minRating: 1,
          initialRating: laundry.rate,
          direction: Axis.horizontal,
          allowHalfRating: false,
          updateOnDrag: false,
          itemCount: 5,
          ignoreGestures: true,
          itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
          onRatingUpdate: (value) {},
          itemSize: 20,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          ' 4.3 ',
          style: getMediumStyle(
            color: Colors.black,
            fontSize: FontSize.s16,
          ),
        ),
      ],
    );
  }

  Widget _buildServicesDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: CustomLabel(
                text: AppLocalizations.of(context)!.laundry_services,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        LaundryServicesTable(
          data: laundry.services,
        ),
      ],
    );
  }

  Widget _buildOffers(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  AppLocalizations.of(context)!.limited_time_offers,
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s18,
                  ),
                ),
              ),
              const OfferBadge()
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ListTile(
            leading: Icon(
              Icons.delivery_dining,
              size: 28,
              color: ColorManager.primary,
            ),
            title: Text(AppLocalizations.of(context)!.free_delivery_offer),
            subtitle: Text(
              '${AppLocalizations.of(context)!.valid_until} ${AppLocalizations.of(context)!.custom_date(DateTime.now())}',
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.local_offer,
              color: ColorManager.primary,
            ),
            title:
                Text(AppLocalizations.of(context)!.discount_offer_perctnage(5)),
            subtitle: Text(
              '${AppLocalizations.of(context)!.valid_until} ${AppLocalizations.of(context)!.custom_date(DateTime.now())}',
            ),
          )
        ],
      ),
    );
  }
}
