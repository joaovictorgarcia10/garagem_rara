import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final String title;
  final String value;

  const InformationCard({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            offset: Offset(2, 4),
            blurRadius: 5,
          )
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 8.0),
      height: 115,
      width: 108,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Text(title),
        ],
      ),
    );
  }
}
