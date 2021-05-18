import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration:
                    BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
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
                    style: TextStyle(
                        color: textColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'example@example.com',
                    style: TextStyle(color: textColor),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'EDIT PROFILE',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.grey)))),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedContainer(
            children: [
              ElevatedContainerRow(
                icon: Icons.format_list_bulleted_sharp,
                text: 'All My Orders',
              ),
              RowDivider(),
              ElevatedContainerRow(
                icon: Icons.local_shipping_outlined,
                text: 'Pending Shipments',
              ),
              RowDivider(),
              ElevatedContainerRow(
                icon: Icons.payment_rounded,
                text: 'Pending Payments',
              ),
              RowDivider(),
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
              RowDivider(),
              ElevatedContainerRow(
                icon: Icons.support_agent_rounded,
                text: 'Customer Support',
              ),
              RowDivider(),
              ElevatedContainerRow(
                icon: Icons.rate_review_outlined,
                text: 'Rate Our App',
              ),
              RowDivider(),
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

const textColor = Color(0xff727c8e);

class ElevatedContainerRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ElevatedContainerRow({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Icon(
            icon,
            color: textColor,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 20, color: textColor),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey[300], shape: BoxShape.circle),
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class RowDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = 2.0;
    return Container(
      child: Column(
        children: [
          SizedBox(height: h),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Divider(color: textColor),
          ),
          SizedBox(height: h),
        ],
      ),
    );
  }
}

class ElevatedContainer extends StatelessWidget {
  final List<Widget> children;

  const ElevatedContainer({Key? key, required this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: white),
            child: Column(children: children),
          ),
        ),
      ),
    );
  }
}
