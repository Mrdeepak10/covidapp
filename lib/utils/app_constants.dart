import 'package:flutter/material.dart';

class AppConstants {
  static final AppConstants _singleton = AppConstants._internal();

  factory AppConstants() {
    return _singleton;
  }

  AppConstants._internal();

  static String userName = '';
  static String userEmail = '';
  static String userCity = '';
  static String userPassword = '';
  static String uid = '';
  static String dId = '';
  static int qc = 1;
  static int lrc = 1;
  static int bc = 1;
  static int mrc = 1;
  //Decoration

  static const ShapeDecoration dropDownDecorationWithBG = ShapeDecoration(
    color: Color(0xffDEDEDE),
    shape: RoundedRectangleBorder(
      side:
      BorderSide(width: 1.0, style: BorderStyle.solid, color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
  );

  static const ShapeDecoration dropDownDecoration = ShapeDecoration(
    color: Color(0xffFFFFFF),
    shape: RoundedRectangleBorder(
      side:
          BorderSide(width: 1.0, style: BorderStyle.solid, color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
  );

  // App colors
  static  Color colorPrimary = Color(0xffff0b31);
  static const Color colorSecondary = Color(0xff05445E);
  static const Color colorAccent = Color(0xff0074B7);
  static const Color buttonColor = Color(0xff428bca);
  static const Color disableColor = Color(0xffF1F1F1);
  static const Color tileColor = Color(0xffFFFFFF);
  static const Color lorryTileColor =  Color(0xffFFF4BD);

  // Color Theme
  static const Color zeroIndexColor = Color(0xff003B73);
  static const Color firstIndexColor = Color(0xff042F39);
  static const Color secondIndexColor = Color(0xff05445E);
  static const Color thirdIndexColor = Color(0xff145DA0);
  static const Color fourthIndexColor = Color(0xffEF7C8E);
  static const Color fifthIndexColor = Color(0xffFFF4BD);
  static const Color sixthIndexColor = Color(0xff85D2D0);
  static const Color seventhIndexColor = Color(0xff887BB0);
  static const Color eighthIndexColor = Color(0xff391306);
  static const Color nineIndexColor = Color(0xffAA1945);
  static const Color tenIndexColor = Color(0xff67595E);
  static const Color elevenIndexColor = Color(0xff2F5061);
  static const Color twelveIndexColor = Color(0xffE57F84);
  static const Color thirteenIndexColor = Color(0xffF4EAE6);
  static const Color fourteenIndexColor = Color(0xff4297A0);
  static const Color fifteenIndexColor = Color(0xffF8EA8C);
  static const Color sixteenIndexColor = Color(0xffF6C8CC);
  static const Color seventeenIndexColor = Color(0xff710117);
  static const Color eighteenIndexColor = Color(0xff54627B);
  static const Color nineteenIndexColor = Color(0xffEEBE35);
  static const Color twentyIndexColor = Color(0xffECD5BB);
  static const Color twentyOneIndexColor = Color(0xff6B7EA4);
  static const Color twentyTwoIndexColor = Color(0xff0C6980);
  static const Color twentyThreeIndexColor = Color(0xffE5DDC8);
  static const Color twentyFourIndexColor = Color(0xff004369);
  static const Color twentyFiveIndexColor = Color(0xffC15B78);
  static const Color twentySixIndexColor = Color(0xff5BB0BA);
  static const Color twentySevenIndexColor = Color(0xff523A28);
  static const Color twentyEightIndexColor = Color(0xff613659);
  static const Color twentyNineIndexColor = Color(0xff821D30);
  static const Color thirtyIndexColor = Colors.black;

  static const Color iconColor = Color(0xff2993c8);
  static const Color appBarColor = Colors.white;
  static const Color appBarTitleColor = Colors.white;
  static const Color textColor = Colors.black54;

  static const String STARTED = "started";
  static const String NOT_COMPLETED = "not_completed";
  static const String END = "end";

  static Color textTitleColor = Colors.grey.shade800;
  static const double textTitleSize = 18.5;
  static const double textSmallSize = 16.0;
  static const double textVerySmallSize = 15.0;
  static const double textVerySmallSize2 = 13.0;
  static const double textSmallMenuSize = 13.5;
  static const double textHeadingSize = 20.5;
  static const double hintTextSize = 18.0;
  static const double fourteenTextSize = 14.0;
  static FontWeight textTitleWeight = FontWeight.w500;

  static Color textSubTitleColor = Colors.grey.shade600;
  static const double textSubTitleSize = 16;
  static FontWeight textSubTitleWeight = FontWeight.w400;

  static const double textMediumSize = 18.5;
  static const double textNormalSize = 17.5;

  // Constant URLs
  static const profile = 'profile';
  static const quotation = 'quotation';
  static const lorryLr = 'lr';
  static const bill = 'bill';
  static const moneyReceipt = 'moneyReceipt';

  // App constant message
  static const MSG_INTERNET_NOT = 'Internet not available please try again!';
  static const MSG_ERROR = 'Error occured';
  static const MSG_NETWORK_CHECK =
      'Please check your device network connection';
  static const MSG_THIS_MENU_IS_DISABLED = 'This menu is disabled';
  static const MSG_DATA_NOT_AVAILABLE = 'Data not available';
  static const MSG_UNDER_DEVELOPMENT = 'This feature is under development';
  static const MSG_COMPANY_DETAILS_NOT_AVAILABLE =
      'Company details not available';
  static const MSG_SERVICES_NOT_AVAILABLE = 'Services not available';
  static const MSG_SERVICES_NOT_AVAILABLE_RETRY =
      'Services not available, Tap her to retry';

  static const two_factor_title = 'Trusted Device ?';
  static const two_factor_message =
      'Are you sure you want to add this device as Trusted Device ?';
}
