

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class RecievedNotificationItem extends StatelessWidget {

  final String text;
  const RecievedNotificationItem({
    Key? key,

    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Text(text),
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          height: 8,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(   AppLocalizations.of(context)!.how_is_your_experience),
        RatingBar.builder(
          itemBuilder: (context, index) {
            return const Icon(
              Icons.star_rounded,
              color: Colors.amber,
            );
          },
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          updateOnDrag: true,
          itemCount: 5,
          ignoreGestures: false,
          itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
          onRatingUpdate: (value) {},
          itemSize: 30,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 100,
          child: TextFormField(
            expands: true,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            decoration:  InputDecoration(
              hintText:   AppLocalizations.of(context)!.your_notes,
              border:const OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.multiline,
            validator: (value) {},
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
                 AppLocalizations.of(context)!.send,
            ),
          ),
        ),
      ],
    );
  }
}
