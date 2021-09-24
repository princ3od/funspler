import 'package:flutter/material.dart';
import 'package:funspler/general/constants/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  bool isLoading = false;
  WhiteButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(AppConstant.kDouble_18),
          side: BorderSide(
            width: AppConstant.kDouble_2,
            color: Colors.black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstant.kDouble_6),
          ),
          primary: Colors.white,
          onPrimary: Colors.black,
          textStyle: GoogleFonts.roboto(
              color: Colors.black, fontSize: 13, fontWeight: FontWeight.w900),
        ),
        onPressed: onPressed,
        child: (!isLoading)
            ? Text(text)
            : SizedBox(
                width: AppConstant.kDouble_15,
                height: AppConstant.kDouble_15,
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
              ));
  }
}
