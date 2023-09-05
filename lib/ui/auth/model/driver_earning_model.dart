class DriverEarningModel {
  dynamic interval;
  dynamic totalTrips;
  dynamic totalKms;
  dynamic totalTripAmount;
  dynamic totalOnlineHours;
  dynamic totalOnlineMins;
  dynamic cashAmount;
  dynamic onlineAmount;
  dynamic netEarnings;
  dynamic extraCharges;
  dynamic ceoCommission;
  dynamic gstAmount;

  DriverEarningModel({
    this.interval,
    this.totalTrips,
    this.totalKms,
    this.totalTripAmount,
    this.totalOnlineHours,
    this.totalOnlineMins,
    this.cashAmount,
    this.onlineAmount,
    this.netEarnings,
    this.extraCharges,
    this.ceoCommission,
    this.gstAmount,
  });


  factory DriverEarningModel.fromJson(Map<String, dynamic> json) =>
      DriverEarningModel(
        interval: json["interval"] == null ? null : json["interval"],
        totalTrips: json["totalTrips"] == null ? null : json["totalTrips"],
        totalKms: json["totalKMS"] == null ? null : json["totalKMS"],
        totalTripAmount: json["totalTripAmount"] == null
            ? null
            : json["totalTripAmount"],
        totalOnlineHours: json["totalOnlineHrs"] == null
            ? null
            : json["totalOnlineHrs"],
        totalOnlineMins: json["totalOnlineMins"] == null
            ? null
            : json["totalOnlineMins"],
        cashAmount: json["cashAmount"] == null ? null : json["cashAmount"],
        onlineAmount: json["onlineAmount"] == null
            ? null
            : json["onlineAmount"],
        netEarnings: json["netEarnings"] == null ? null : json["netEarnings"],
        extraCharges: json["extraCharges"] == null
            ? null
            : json["extraCharges"],
        ceoCommission: json["ceoCommission"] == null
            ? null
            : json["ceoCommission"],
        gstAmount: json["gstAmount"] == null ? null : json["gstAmount"],
      );

  Map<String, dynamic> toJson() =>
      {
        'interval': interval,
        'totalTrips': totalTrips,
        'totalKMS': totalKms,
        'totalTripAmount': totalTripAmount,
        'totalOnlineHrs': totalOnlineHours,
        'totalOnlineMins': totalOnlineMins,
        'cashAmount': cashAmount,
        'onlineAmount': onlineAmount,
        'netEarnings': netEarnings,
        'extraCharges': extraCharges,
        'ceoCommission': ceoCommission,
        'gstAmount': gstAmount,
      };
}
