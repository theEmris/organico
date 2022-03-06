import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:organico/constants/buttons/k_buttons.dart';
import 'package:provider/provider.dart';
import '../../provider/textProvider.dart';

class columnOfContainerChild {
  static showChildColumnOfContainer(
      List vege, int index, List choosedList, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: vege[0][index]['image'],
            height: 79,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vege[0][index]['name'],
                style: context.watch<TextProvider>().TextDesignBold,
              ),
              Text(vege[0][index]['desc'],
                  style: context.watch<TextProvider>().TextDesignOpen),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${vege[0][index]['price']}/kg',
                style: context.watch<TextProvider>().TextDesignBold,
              ),
              InkWell(
                child: constButtonStyles.kButtonAdd,
                onTap: () {
                  choosedList.add(vege[0][index]);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
