import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF035AA6);
const kSecondaryColor = Color(0xFFFFA41B);
const kTextColor = Color(0xFF000839);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);

const kHintStyle = TextStyle(
  fontSize: 13,
  letterSpacing: 1.2,
);

var kOutlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Colors.transparent),
);

var kErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Colors.transparent),
);
const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(5, 5),
  blurRadius: 5,
  spreadRadius: 3,
  color: Colors.black54,
);

//yükleniyor butonu
const kLoaderBtn = SizedBox(
    height: 20,
    width: 20,
    child: CircularProgressIndicator(
      strokeWidth: 1.5,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    ));
