import 'package:flutter/material.dart';
import 'package:gestion_freelance/utils/constants.dart';
import 'package:page_transition/page_transition.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80.0,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Text("asdad"),
            )
          ],
        ),
      ),
    );
  }
}
