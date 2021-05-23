import 'package:e_commerce_app/widgets/common_variables.dart';
import 'package:flutter/material.dart';

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
            style: TextStyle(fontSize: 15, color: textColor),
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

  List<Widget> getChildren() {
    List<Widget> result = <Widget>[];
    for (var child in children) {
      result.add(child);
      result.add(RowDivider());
    }
    result.removeLast();
    return result;
  }

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
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(children: getChildren()),
          ),
        ),
      ),
    );
  }
}
