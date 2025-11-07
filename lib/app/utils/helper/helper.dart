import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../color/color.dart';

class Helper {
  static setHeight(BuildContext context, {height = 1}) {
    return MediaQuery.of(context).size.height * height;
  }

  static setWidth(BuildContext context, {width = 1}) {
    return MediaQuery.of(context).size.width * width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // static Future<File> compressFile(
  //     {required File file, quality = 100, percentage = 30}) async {
  //   var path = await FlutterNativeImage.compressImage(file.absolute.path,
  //       quality: 70, percentage: 40);
  //   return path;
  // }

  // static toScreen(context, screen) {
  //   Navigator.push(context, SlideRightToLeft(page: screen));
  // }

  // static toReplacementScreenSlideRightToLeft(context, screen) {
  //   Navigator.pushReplacement(context, SlideRightToLeft(page: screen));
  // }

  // static toReplacementScreenSlideLeftToRight(context, screen) {
  //   Navigator.pushReplacement(context, SlideLeftToRight(page: screen));
  // }

  // static toRemoveUntiScreen(context, screen) {
  //   Navigator.pushAndRemoveUntil(
  //       context, SlideRightToLeft(page: screen), (route) => false);
  // }
  //
  // static onWillPop(context, screen) {
  //   Navigator.pushAndRemoveUntil(
  //       context, SlideRightToLeft(page: screen), (route) => false);
  // }

  static showSnack(context, message,
      {color = primary, duration = 2}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          style: TextStyle(fontSize: 15, color: white),
        ),
        backgroundColor: color,
        duration: Duration(seconds: duration)));
  }

  // static showToast({msg}) {
  //   Fluttertoast.showToast(msg: msg);
  // }

  // static offlinePopUp(String text, BuildContext context) {
  //   Future.delayed(Duration(milliseconds: 100), () async {
  //     Helper.showSnack(context, text);
  //   });
  // }

  // static circulProggress(context) {
  //   const Center(
  //     child: CircularProgressIndicator(
  //       valueColor: AlwaysStoppedAnimation(AppColors.primary),
  //     ),
  //   );
  // }

  // static showLog(message) {
  //   log("APP SAYS: $message");
  // }
  //
  // static boxDecoration(Color color, double radius) {
  //   BoxDecoration(
  //       color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
  // }

  static String formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String getDateMMMdyyyy(DateTime date) {
    DateFormat formatter = DateFormat('MMM d, yyyy');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  // static String timeAgoSinceDate(DateTime date, {bool numericDates = true}) {
  //   try {
  //     DateTime notificationDate = date;
  //     final date2 = DateTime.now();
  //     final difference = date2.difference(notificationDate);
  //     if (difference.inDays > 8) {
  //       // return '${notificationDate.year}/${notificationDate.month}/${notificationDate.day}';
  //       return DateFormat('yyyy/MM/dd').format(
  //         notificationDate,
  //       );
  //     } else if ((difference.inDays / 7).floor() >= 1) {
  //       return (numericDates) ? '1 week ago' : 'Last week';
  //     } else if (difference.inDays >= 2) {
  //       return '${difference.inDays} ${"days ago"}';
  //     } else if (difference.inDays >= 1) {
  //       return (numericDates) ? '1 day ago' : 'Yesterday';
  //     } else if (difference.inHours >= 2) {
  //       return '${difference.inHours} ${"hours ago"}';
  //     } else if (difference.inHours >= 1) {
  //       return (numericDates) ? '1 hour ago' : 'An hour ago';
  //     } else if (difference.inMinutes >= 2) {
  //       return '${difference.inMinutes} ${"minutes ago"}';
  //     } else if (difference.inMinutes >= 1) {
  //       return (numericDates) ? '1 minute ago' : 'A minute ago';
  //     } else if (difference.inSeconds >= 3) {
  //       return '${difference.inSeconds} ${'seconds ago'}';
  //     } else {
  //       return 'Just Now';
  //     }
  //   } catch (e) {
  //     return '';
  //   }
  // }
}

class RadioSelectionManager {
  static int _selectedValue = 1; // default to first radio button

  /// Set the selected value
  static void setSelectedValue(int value) {
    _selectedValue = value;
    print("Manager updated to value: $value");
  }

  /// Get the selected value
  static int getSelectedValue() {
    print("Current manager value: $_selectedValue");
    return _selectedValue;
  }
}

