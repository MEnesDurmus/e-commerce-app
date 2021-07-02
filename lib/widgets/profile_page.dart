import 'package:e_commerce_app/styles/app_text_styles.dart';
import 'package:e_commerce_app/styles/colors.dart';
import 'package:e_commerce_app/widgets/components/elevated_container.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: bgColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Enes',
                      style: titleStyle,
                    ),
                    Text(
                      'example@example.com',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            SizedBox(width: 5),
                            Text(
                              'EDIT PROFILE',
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                          ],
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(bgColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side:
                                    BorderSide(color: textColor.withAlpha(30)),
                              ),
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          ElevatedContainer(
            children: [
              ElevatedContainerRow(
                icon: Icons.format_list_bulleted_sharp,
                text: 'All My Orders',
              ),
              ElevatedContainerRow(
                icon: Icons.local_shipping_outlined,
                text: 'Pending Shipments',
              ),
              ElevatedContainerRow(
                icon: Icons.payment_rounded,
                text: 'Pending Payments',
              ),
              ElevatedContainerRow(
                icon: Icons.badge_rounded,
                text: 'Finished Orders',
              )
            ],
          ),
          SizedBox(height: 5),
          ElevatedContainer(
            children: [
              ElevatedContainerRow(
                icon: Icons.mail_outline_rounded,
                text: 'Invite Friends',
              ),
              ElevatedContainerRow(
                icon: Icons.support_agent_rounded,
                text: 'Customer Support',
              ),
              ElevatedContainerRow(
                icon: Icons.rate_review_outlined,
                text: 'Rate Our App',
              ),
              ElevatedContainerRow(
                icon: Icons.mode_edit_outline_rounded,
                text: 'Make a Suggestion',
              )
            ],
          )
        ],
      ),
    );
  }
}
