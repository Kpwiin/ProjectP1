import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:monkeydosomething/const/button.dart';
import 'package:monkeydosomething/page/deliveryprogresspage.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key});

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFoused = false;

  // user wants to pay

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //only show dialog if form is valid
      showDialog(
        context: (context),
        builder: (context) => AlertDialog(
          title: Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number $cardNumber"),
                Text("Expiry Date $expiryDate"),
                Text("Card Holder name  $cardHolderName"),
                Text("CVV $cvvCode"),
              ],
            ),
          ),
          actions: [
            // cancel button
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
                ),
                // Yes button
                TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeliveryProgressPage(),
                        ),
                        ),
                child: Text("Yes"),
                )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("payment"),
      ),
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFoused,
            onCreditCardWidgetChange: (p0) {},
          ),
          // credit card form
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
            formKey: formKey,
          ),

          Spacer(),

          Mybutton(
            onTap: userTappedPay,
            text: "Pay now",
            Function: () {},
          ),

          SizedBox(height: 25),
        ],
      ),
    );
  }
}
