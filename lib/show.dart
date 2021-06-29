import 'package:flutter/material.dart';

import 'TextWidgets.dart';

class Show extends StatelessWidget{

  final String picUrlText;
  final String titleText;
  final String sloganText;
  final String hqText;

  Show(this.picUrlText, this.titleText, this.sloganText, this.hqText);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          Image.network(picUrlText),
          const SizedBox(height: 8),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          TextTitle(titleText),
          TextSlogan(sloganText),
          TextHq(hqText),
        ],
      );
  }

}