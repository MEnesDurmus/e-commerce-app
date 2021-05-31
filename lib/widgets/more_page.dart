import 'package:e_commerce_app/styles/colors.dart';
import 'package:e_commerce_app/widgets/common_variables.dart';
import 'package:e_commerce_app/widgets/elevated_container.dart';
import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        color: bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "More",
                style: titleStyle,
              ),
            ),
            ElevatedContainer(children: [
              ElevatedContainerRow(
                  icon: Icons.flag_outlined, text: 'Shipping Address'),
              ElevatedContainerRow(
                  icon: Icons.payments_outlined, text: 'Payment Method'),
              ElevatedContainerRow(
                  icon: Icons.account_balance_wallet_outlined,
                  text: 'Currency'),
              ElevatedContainerRow(
                  icon: Icons.translate_outlined, text: 'Language'),
            ]),
            SizedBox(height: 10),
            ElevatedContainer(children: [
              ElevatedContainerRow(
                  icon: Icons.notifications, text: 'Notification Settings'),
              ElevatedContainerRow(
                  icon: Icons.privacy_tip_outlined, text: 'Privacy Policy'),
              ElevatedContainerRow(
                  icon: Icons.question_answer_outlined,
                  text: 'Frequently Asked Questions'),
              ElevatedContainerRow(
                  icon: Icons.text_snippet_outlined, text: 'Legal Information'),
            ]),
            SizedBox(height: 20),
            Center(
                child: Text(
              'LOG OUT',
              style: TextStyle(color: mRedAccent),
            ))
          ],
        ));
  }
}
