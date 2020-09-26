import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce_ui/size_config.dart';


class FormError extends StatelessWidget {
  const FormError({
    Key key,
    this.errors,
  }) : super(key: key);
  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionScreenHeight(24),
          width: getProportionScreenWidth(24),
        ),
        SizedBox(
          width: getProportionScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
