import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zenpill_app/core/theme/app_text_style.dart';

import '../../theme/app_colors.dart';
import 'bloc/text_form_field_cubit.dart';
import 'bloc/text_form_field_state.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.hintText,
      this.isPassword = false,
      this.isConfirmPassword = false,
      required this.controller,
      required this.prefix,
      this.onChanged,
      this.validator});

  final String? hintText;
  bool isPassword;
  bool isConfirmPassword;
  TextEditingController controller;
  final String prefix;
  Function(dynamic)? onChanged;
  String? Function(dynamic)? validator;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFormFieldCubit, TextFormFieldState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            fillColor: AppColors.cardBackgroundColor,
            prefixIcon: SvgPicture.asset(prefix),

            hintText: hintText,
            hintStyle: AppTextStyle.f16W400Black,
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: AppColors.cardBackgroundColor)),
            // enabledBorder: UnderlineInputBorder(
            //     borderSide: BorderSide(color: Colors.black)),
            suffixIcon: Visibility(
                visible: isPassword || isConfirmPassword,
                child: IconButton(
                  onPressed: () {
                    if (isPassword)
                      context.read<TextFormFieldCubit>().changeHiddenStatue();
                    else if (isConfirmPassword)
                      context
                          .read<TextFormFieldCubit>()
                          .changeConfrimHiddenStatue();
                  },
                  icon: Icon(isPassword
                      ? (context.read<TextFormFieldCubit>().hiddenPassword)
                          ? Icons.visibility_off
                          : Icons.visibility
                      : (isConfirmPassword)
                          ? (context
                                  .read<TextFormFieldCubit>()
                                  .hiddenConfirmPassword)
                              ? Icons.visibility_off
                              : Icons.visibility
                          : null),
                )),
          ),
          obscureText: isPassword
              ? context.read<TextFormFieldCubit>().hiddenPassword
              : isConfirmPassword
                  ? context.read<TextFormFieldCubit>().hiddenConfirmPassword
                  : false,
        );
      },
    );
  }
}
