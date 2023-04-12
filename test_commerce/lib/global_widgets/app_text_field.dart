import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilities/utilities.dart';

class AppTextField extends StatelessWidget {
  final bool? hasIcon;
  final String? icon;
  final String? hintText;
  final Function? onChanged;
  final TextEditingController? controller;
  final String? label;
  final TextInputType? textInputType;
  const AppTextField(
      {super.key,
      this.label,
      this.hasIcon = false,
      this.icon = '',
      this.hintText = '',
      this.onChanged,
      this.controller,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? const SizedBox.shrink()
            : Text(
                label!,
                style: AppTextStyle.regularText14(context),
              ),
        SizedBox(height: AppDimensions.height(context) * 0.0125),
        Container(
          height: AppDimensions.height(context) * 0.055,
          width: AppDimensions.width(context),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.offGrey),
          child: Padding(
            padding: AppDimensions.horizontalPadding(context),
            child: TextFormField(
              controller: controller,
              onChanged: (val) {
                if (onChanged != null) {
                  onChanged!(val);
                }
              },
              keyboardType: textInputType,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppTextStyle.mediumText14(context)
                      .copyWith(color: AppColors.halfGrey),
                  border: InputBorder.none,
                  suffixIcon: Container(
                    padding: AppDimensions.width(context) > 500
                        ? EdgeInsets.all(AppDimensions.width(context) * 0.015)
                        : EdgeInsets.all(AppDimensions.width(context) * 0.035),
                    child: hasIcon!
                        ? SvgPicture.asset(
                            icon!,
                          )
                        : null,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
