import 'package:flutter/material.dart';
import 'package:resku/core.dart';

// ignore: must_be_immutable
class ProsesItemWidget extends StatelessWidget {
  const ProsesItemWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        top: 10.5,
        bottom: 10.5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: getPadding(
              bottom: 2,
            ),
            child: Text(
              "Jus Pisangg",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: ColorConstant.black900,
                fontSize: getFontSize(
                  15,
                ),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 58,
              top: 2,
            ),
            child: Text(
              "3",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: ColorConstant.black900,
                fontSize: getFontSize(
                  15,
                ),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 51,
              top: 2,
            ),
            child: Text(
              " Rp. 3.0000",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: ColorConstant.black900,
                fontSize: getFontSize(
                  15,
                ),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
