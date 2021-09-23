import 'package:flutter/material.dart';
import 'package:funspler/general/constants/app_constant.dart';

InputDecoration defaultTextfieldDecoration({required String hint}) =>
    InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.all(AppConstant.kDouble_16),
      fillColor: Colors.transparent,
      filled: true,
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: AppConstant.kDouble_2),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: AppConstant.kDouble_2),
      ),
    );
