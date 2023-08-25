class EarningFilterDataModel {
  dynamic interval;
  dynamic totalTrips;
  dynamic totalKms;
  dynamic totalTripAmount;
  dynamic totalOnlineHrs;
  String? netEarnings;
  String? extraCharges;
  String? ceoCommission;
  String? gstAmount;

  EarningFilterDataModel({
    this.interval,
    this.totalTrips,
    this.totalKms,
    this.totalTripAmount,
    this.totalOnlineHrs,
    this.netEarnings,
    this.extraCharges,
    this.gstAmount,
    this.ceoCommission,
  });

  EarningFilterDataModel.fromJson(Map<String, dynamic> json)
      : interval = json['interval'],
        totalTrips = json['totalTrips'],
        totalKms = json['totalKMS'],
        totalTripAmount = json['totalTripAmount'],
        totalOnlineHrs = json['totalOnlineHrs'],
        netEarnings = json['netEarnings'],
        extraCharges = json['extraCharges'],
        ceoCommission = json['ceoCommission'],
        gstAmount = json['gstAmount'];

  Map<String, dynamic> toJson() => {
        'interval': interval,
        'totalTrips': totalTrips,
        'totalKMS': totalKms,
        'totalTripAmount': totalTripAmount,
        'totalOnlineHrs': totalOnlineHrs,
        'netEarnings': netEarnings,
        'extraCharges': extraCharges,
        'ceoCommission': ceoCommission,
        'gstAmount': gstAmount,
      };
}
