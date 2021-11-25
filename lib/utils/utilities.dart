import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'app_constants.dart';
import 'app_preferences.dart';

class Utility {
  static Future<bool> isNetworkAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
    return false;
  }

  static Future<String> getCounter({String? counterName}) async {
    int random = Random().nextInt(10);
    String? dateTracker = await AppSharedPreference.getDateTracker();
    print('dateTracker:$dateTracker');
    String counter = '';
    switch (counterName) {
      case AppConstants.quotation:
        String date = DateFormat('yyyyMM').format(DateTime.now());
        var tmpCount = await AppSharedPreference.getQuotationCounter();
        if (dateTracker != date) {
          tmpCount = 1;
          AppSharedPreference.setQuotationCounter(1);
        } else {
          if (tmpCount == null) {
            print("if");
            tmpCount = 1;
            AppSharedPreference.setQuotationCounter(1);
          } else {
            print("Counter:$tmpCount");
          }
        }
        counter = 'Q${AppConstants.userCity}$date$random$tmpCount';
        break;
      case AppConstants.bill:
        String date = DateFormat('yyyyMM').format(DateTime.now());
        var tmpCount = await AppSharedPreference.getBillCounter();
        if (dateTracker != date) {
          tmpCount = 1;
          AppSharedPreference.setBillCounter(1);
        } else {
          if (tmpCount == null) {
            print("if");
            tmpCount = 1;
            AppSharedPreference.setBillCounter(1);
          } else {
            print("Counter:$tmpCount");
          }
        }
        counter = 'T${AppConstants.userCity}$date$random$tmpCount';
        break;
      case AppConstants.lorryLr:
        String date = DateFormat('yyyyMM').format(DateTime.now());
        var tmpCount = await AppSharedPreference.getLrCounter();
        if (dateTracker != date) {
          tmpCount = 1;
          AppSharedPreference.setLrCounter(1);
        } else {
          if (tmpCount == null) {
            print("if");
            tmpCount = 1;
            AppSharedPreference.setLrCounter(1);
          } else {
            print("Counter:$tmpCount");
          }
        }
        counter = '$date$random$tmpCount';
        break;
      case AppConstants.moneyReceipt:
        String date = DateFormat('yyyyMM').format(DateTime.now());
        var tmpCount = await AppSharedPreference.getMrCounter();
        if (dateTracker != date) {
          tmpCount = 1;
          AppSharedPreference.setMrCounter(1);
        } else {
          if (tmpCount == null) {
            print("if");
            tmpCount = 1;
            AppSharedPreference.setMrCounter(1);
          } else {
            print("Counter:MRIND$tmpCount");
          }
        }
        counter = 'M${AppConstants.userCity}$date$random$tmpCount';
        break;
    }
    return counter;
  }

  static circularIndicator(_progressHUD) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 100, width: 100, child: _progressHUD),
            const SizedBox(height: 40)
          ],
        ));
  }

  static void showToast(BuildContext context, String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showSnackBar(scaffoldMessengerKey, message) {
    return scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text('$message'),
      duration: const Duration(seconds: 1),
      backgroundColor: AppConstants.colorPrimary,
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {
          scaffoldMessengerKey.currentState.hideCurrentSnackBar();
        },
      ),
    ));
  }

  // static void launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  static void showAlertBox(
      {required BuildContext context,
      required String title,
      required String message}) {
    // set up the button
    Widget yesButton = TextButton(
      child: Text("Yes", style: TextStyle(color: AppConstants.colorPrimary)),
      onPressed: () {
        // Setting firstTimeLaunch flag
        AppSharedPreference.setLoggedIn(true);
        // Redirect to Home
      },
    );
    Widget noButton = TextButton(
      child: Text("No", style: TextStyle(color: AppConstants.colorPrimary)),
      onPressed: () {
        // Setting firstTimeLaunch flag
        AppSharedPreference.setFirstTimeLaunch(true);
        // Redirect to Home
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
        style: const TextStyle(color: AppConstants.textColor),
      ),
      content:
          Text(message, style: const TextStyle(color: AppConstants.textColor)),
      actions: [noButton, yesButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static AppBar appBarDynamic(titleText, context) {
    return AppBar(
      backgroundColor: AppConstants.colorPrimary,
      title: Text(
        '$titleText',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  // static void openWebsite(
  //     {BuildContext context, String caption, String website}) {
  //   try {
  //     var networkAvailable = Utility.isNetworkAvailable();
  //     if (networkAvailable != null) {
  //       networkAvailable.then((isNetworkReady) {
  //         if (isNetworkReady) {
  //           if (website != null && website != '') {
  //             print('loading url: $website');
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (BuildContext context) => MyWebView(
  //                           title: caption,
  //                           selectedUrl: website,
  //                         )));
  //           } else {
  //             print('Website url is null');
  //             showAlertDialog(context, caption);
  //           }
  //         } else {
  //           Utility.showToast(context, AppConstants.MSG_INTERNET_NOT);
  //         }
  //       });
  //     } else {
  //       Utility.showToast(context, AppConstants.MSG_NETWORK_CHECK);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  static void showAlertDialog(BuildContext context, String caption) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error Occured"),
      content: Text("Sorry can not load $caption page."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showAlertWithMessage(BuildContext context, String message) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Message'),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
