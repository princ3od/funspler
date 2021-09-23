import 'package:flutter/material.dart';
import 'package:funspler/general/constants/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class BlackButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BlackButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(AppConstant.kDouble_18),
          primary: Colors.black,
          textStyle:
              GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w900),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstant.kDouble_6),
          ),
          onPrimary: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(text));
  }
}
