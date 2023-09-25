import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:saudi_clean_services/core/managers/font_manager.dart';
import 'package:saudi_clean_services/core/managers/styles_manager.dart';
import 'package:saudi_clean_services/core/utils/helpers/credit_card_utils.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/dialog/loading_dialog.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/dialog/sent_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/utils/enums/enums.dart';

class CreditCardInfo extends StatefulWidget {
  final PayTypes payTypes;
  const CreditCardInfo({
    Key? key,
    required this.payTypes,
  }) : super(key: key);

  @override
  State<CreditCardInfo> createState() => _CreditCardInfoState();
}

class _CreditCardInfoState extends State<CreditCardInfo> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> numberKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> cvvKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> dateKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> holderKey =
      GlobalKey<FormFieldState<String>>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              cardHolderName: cardHolderName,
              expiryDate: expiryDate,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
              cardType: getCardType(),
              isHolderNameVisible: true,
              isChipVisible: true,
              isSwipeGestureEnabled: true,
            ),
            CreditCardForm(
              formKey: formKey,
              cardNumberKey: numberKey,
              cvvCodeKey: cvvKey,
              expiryDateKey: dateKey,
              cardHolderKey: holderKey,
              onCreditCardModelChange: onCreditCardModelChange,
              themeColor: Colors.red,
              cardNumberValidator: (p0) =>
                  CardUtils.validateNumber(context, p0),
              expiryDateValidator: (p0) => CardUtils.validateDate(p0, context),
              cardHolderValidator: (p0) =>
                  CardUtils.validateCardHolder(p0, context),
              cvvValidator: (p0) => CardUtils.validateCVV(p0, context),
              cardNumberDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number',
                hintText: 'XXXX XXXX XXXX XXXX',
              ),
              expiryDateDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Expired Date',
                hintText: 'XX/XX',
              ),
              cvvCodeDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CVV',
                hintText: 'XXX',
              ),
              cardHolderDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Card Holder',
              ),
              obscureCvv: true,
              obscureNumber: true,
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              cardHolderName: cardHolderName,
              expiryDate: expiryDate,
              isHolderNameVisible: true,
              isCardNumberVisible: true,
              isExpiryDateVisible: true,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: const Color(0xff1b447b),
                ),
                child: Text(
                  AppLocalizations.of(context)!.pay,
                  style: getRegularStyle(
                      color: Colors.white, fontSize: FontSize.s16),
                ),
                onPressed: () {
                  bool isValid1 = cvvKey.currentState!.validate();
                  bool isValid2 = numberKey.currentState!.validate();
                  bool isValid3 = holderKey.currentState!.validate();
                  bool isValid4 = dateKey.currentState!.validate();
                  if (isValid1 && isValid2 && isValid3 && isValid4) {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => showLoadingDialog(context,
                          '${AppLocalizations.of(context)!.paying_in_progress} ...'),
                    );
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => showSentDialog(context),
                        );
                      },
                    );
                  } else {
                    print('invalid!');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  CardType getCardType() {
    return widget.payTypes == PayTypes.visaCard
        ? CardType.visa
        : CardType.mastercard;
  }
}
