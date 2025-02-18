import 'package:flutter/material.dart';

import 'package:scholar_chat/pages/color_manager.dart';

class CustomFeatures extends StatefulWidget {
  final String FeaturesTitle;
  final String DetailsFeatures;

  CustomFeatures({
    required this.FeaturesTitle,
    required this.DetailsFeatures,
  });

  @override
  State<CustomFeatures> createState() => _FeaturesState();
}

class _FeaturesState extends State<CustomFeatures> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        '${widget.FeaturesTitle}',
        style: TextStyle(fontSize: 20, color: ColorManager.colorGrayBlue,),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 1, 25, 20),
          child: Container(
            child: Text(
              '${widget.DetailsFeatures}',
              style: TextStyle(
                  fontSize: 17, color:  Color.fromRGBO(130, 8, 8, 0.984)),
            ),
          ),
        ),
      ],
    );
  }
}
