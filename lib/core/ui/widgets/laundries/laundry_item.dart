import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/ui/widgets/offer_badge.dart';

import '../../../../features/laundries/data/laundry.dart';
import '../../../../features/laundries/presentation/screens/laundry_details_screen.dart';
import '../../../managers/assets_manager.dart';
import '../../../managers/color_manager.dart';
import '../../../managers/font_manager.dart';
import '../../../managers/styles_manager.dart';

class LaundryItem extends StatelessWidget {
  final Laundry laundry;
  const LaundryItem({
    Key? key,
    required this.laundry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              LaundryDetailsScreen.routeName,
              arguments: {'laundry': laundry},
            );
          },
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildRate(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildName(),
                        _buildLocation(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                if (laundry.hasOffer) _buildBadge(),
                _buildFavIcon(),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Row _buildLocation() {
    return Row(children: [
      Icon(
        Icons.location_on,
        color: ColorManager.primary,
        size: 18,
      ),
      const SizedBox(
        width: 4,
      ),
      Flexible(
        child: Text(
          laundry.location,
          style: getMediumStyle(
            color: ColorManager.primary,
            fontSize: FontSize.s16,
          ).copyWith(overflow: TextOverflow.ellipsis),
          maxLines: 1,
        ),
      ),
    ]);
  }

  Text _buildName() {
    return Text(
      laundry.name,
      style: getBoldStyle(
        color: Colors.black,
        fontSize: FontSize.s16,
      ).copyWith(overflow: TextOverflow.ellipsis),
      maxLines: 1,
    );
  }

  Padding _buildRate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Text(
            '${laundry.rate}/5.0',
            style: getRegularStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildFavIcon() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Icon(
        Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }

  Padding _buildBadge() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: OfferBadge(),
    );
  }
}
