import 'package:flutter/material.dart';
import 'package:rop_stam_assignment/AppModule/utils/Fonts/AppDimensions.dart';
import 'package:rop_stam_assignment/AppModule/utils/Fonts/font_weights.dart';

import '../../utils/app_text.dart';

class CardWidget extends StatelessWidget {
  final Image? image;
  final String? name,moedl;
  const CardWidget({Key? key,this.image,this.name,this.moedl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(
                0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            child: image,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppText(
                text:
                '$name',
                fontSize: AppDimensions.FONT_SIZE_19,
                fontWeight: FontWeights.semiBold,
              ),
              AppText(
                text:
                '$moedl',
                fontSize: AppDimensions.FONT_SIZE_18,
                fontWeight: FontWeights.regular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}