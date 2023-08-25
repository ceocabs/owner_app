import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getVerboseDateTimeRepresentation(String dateTimes) {
  DateFormat dateFormat = DateFormat("dd MMM, yyyy · hh:mm a", "en");
  DateTime dateTime = dateFormat.parse(dateTimes);
  DateTime now = DateTime.now();
  DateTime justNow = now.subtract(Duration(minutes: 1));
  DateTime localDateTime = dateTime.toLocal();

  if (!localDateTime.difference(justNow).isNegative) {
    return 'Just now';
  }

  String roughTimeString = DateFormat('jm').format(dateTime);

  if (localDateTime.day == now.day &&
      localDateTime.month == now.month &&
      localDateTime.year == now.year) {
    return roughTimeString;
  }

  DateTime yesterday = now.subtract(Duration(days: 1));

  if (localDateTime.day == yesterday.day &&
      localDateTime.month == now.month &&
      localDateTime.year == now.year) {
    return 'Yesterday, ' + roughTimeString;
  }

  if (now.difference(localDateTime).inDays < 4) {
    String weekday = DateFormat('EEEE').format(localDateTime);

    return '$weekday, $roughTimeString';
  }

  return '${DateFormat('yMd').format(dateTime)}, $roughTimeString';
}

extension StringX on String {
  String? getTime(String outFormat) {
    var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(this, true);
    var dateLocal = dateTime.toLocal();
  }

  String? timeFromStamp({String outFormat = "hh:mm a"}) {
    try {
      var dateTime =
          DateTime.fromMillisecondsSinceEpoch(int.parse(this) * 1000);

      return DateFormat(outFormat).format(dateTime);
    } catch (error) {
      debugPrint("DateTimeHelper_timeFromStamp");
      debugPrint(error.toString());
    }
  }

  String timeAgoFromStamp() {
    DateTime timeStamp =
        DateTime.fromMillisecondsSinceEpoch(int.parse(this) * 1000);
    return '${DateFormat('dd MMM yyyy').format(timeStamp)}';

    DateTime now = DateTime.now();
    DateTime justNow = now.subtract(Duration(minutes: 1));
    DateTime localDateTime = timeStamp.toLocal();

    if (!localDateTime.difference(justNow).isNegative) {
      return 'Just now';
    }

    String roughTimeString = DateFormat('jm').format(timeStamp);

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return roughTimeString;
    }

    DateTime yesterday = now.subtract(Duration(days: 1));

    if (localDateTime.day == yesterday.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Yesterday, ' + roughTimeString;
    }

    if (now.difference(localDateTime).inDays < 4) {
      String weekday = DateFormat('EEEE').format(localDateTime);

      return '$weekday, $roughTimeString';
    }

    return '${DateFormat('dd MMM yyyy').format(timeStamp)}';
  }

  String? formatDateTime(
      {String inFormat = "yyyy-MM-dd hh:mm:ss",
      String outFormat = "dd MMM, yyyy"}) {
    try {
      var dateTime = DateFormat(inFormat).parse(this);
      return DateFormat(outFormat).format(dateTime);
    } catch (error) {
      debugPrint("DateTimeHelper_timeFromStamp");
      debugPrint(error.toString());
    }
  }

  String localDateTime() {
    DateTime dateTime = DateTime.parse(this);
    dateTime = dateTime.add(DateTime.parse(
      this,
    ).timeZoneOffset);
    return '${DateFormat('dd MMM yyyy hh:mm a').format(dateTime)}';
  }

  String localTime() {
    DateTime dateTime = DateTime.parse(this);
    dateTime = dateTime.add(DateTime.parse(
      this,
    ).timeZoneOffset);
    return '${DateFormat('hh:mm a').format(dateTime)}';
  }

  String localTimeWithSec() {
    DateTime dateTime = DateTime.parse(this);
    dateTime = dateTime.add(DateTime.parse(
      this,
    ).timeZoneOffset);
    print(dateTime.toUtc().toString() + " utc time......");
    return '${DateFormat('yyyy-MM-dd hh:mm:ss', "en").format(
      dateTime,
    )}';
  }

  String differenceSec(DateTime ordertime, DateTime currentTime) {
    final Duration durdef = currentTime.difference(ordertime);
    print("${durdef.inSeconds} Seconds");
    /*  DateTime dateTime = DateTime.parse(this);
    dateTime = dateTime.add(DateTime.parse(
      this,
    ).timeZoneOffset);*/

    return '${durdef.inSeconds}';
  }
}
