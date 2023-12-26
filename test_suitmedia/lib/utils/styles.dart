import 'package:flutter/material.dart';
import 'package:test_suitmedia/utils/colors.dart';

class Styles {
  static BoxDecoration background = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.primary,
        AppColors.secondary,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  static BoxDecoration addPerson = BoxDecoration(
    borderRadius: BorderRadius.circular(500),
    color: AppColors.circle,
  );

  static InputDecoration inputName = InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(
      25,
      15,
      0,
      15,
    ),
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: AppColors.primary,
      ),
    ),
    hintText: 'Name',
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: AppColors.secondary,
    ),
  );

  static TextStyle textInput = TextStyle(
    color: AppColors.primary,
    fontSize: 15,
  );

  static InputDecoration inputPolindrome = InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(
      25,
      15,
      0,
      15,
    ),
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: AppColors.primary,
      ),
    ),
    hintText: 'Polindrome',
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: AppColors.secondary,
    ),
  );

  static ButtonStyle containerBtn = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(
      vertical: 15,
      horizontal: 0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );

  static TextStyle selectUser = TextStyle(
    fontSize: 30,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );
}
