import 'package:desafio_hostaraguaia/src/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FormCustom extends StatelessWidget {
  final Function(String)? onSubmitted;
  final Color? color;
  final TextEditingController? controller;
  const FormCustom({
    Key? key,
    required this.onSubmitted,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, bottom: 77),
      child: Container(
        height: 45,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 2,
              color: Constants.shadowColor!,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onSubmitted: onSubmitted,
                  showCursor: true,
                  cursorColor: const Color.fromARGB(255, 79, 79, 79),
                  decoration: const InputDecoration(
                    hintText: 'Digite o nome do Pokemon...',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 189, 189, 189),
                    ),
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Constants.colorGrey2,
                  ),
                ),
              ),
              SizedBox(
                child: SvgPicture.asset(
                  'assets/search.svg',
                  height: 22,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}