import 'package:desafio_hostaraguaia/src/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool isBlue;
  final bool isBlocked;

  const DefaultButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.isBlue,
    required this.isBlocked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isBlocked
                ? Constants.colorGrey4
                : isBlue
                    ? Constants.primaryColor
                    : Constants.colorYellow,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: Text(
          title.toUpperCase(),
          style: GoogleFonts.openSans(
            color: isBlocked
                ? Colors.white
                : isBlue
                    ? Colors.white
                    : Constants.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
