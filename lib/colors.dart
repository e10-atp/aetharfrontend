import 'package:flutter/material.dart';

const aePurple50 = Color(0xFFEDE7F6);
const aePurple100 = Color(0xFFD1C4E9);
const aePurple300 = Color(0xFF9575CD);
const aePurple400 = Color(0xFF7E57C2);

const aeBlack900 = Color(0xFF1A1113);

const aeErrorRed = Color(0xFFCB0548);

const aeSurfaceWhite = Color(0xFFFDFAFF);
const aeBackgroundWhite = Colors.white;

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}