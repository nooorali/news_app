import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme{
  
  static Color primaryColor=Color(0xff39A552);
  static ThemeData lightTheme= ThemeData(
    primaryColor:primaryColor,
    appBarTheme: AppBarTheme(
      color: primaryColor,
      elevation: 0.0,
      toolbarHeight: 75,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        )
      )
    ),
    textTheme: TextTheme(
        titleLarge: GoogleFonts.exo(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color:Colors.black ,
        ),
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        bodySmall: GoogleFonts.monda(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        )
    ),
  );
}