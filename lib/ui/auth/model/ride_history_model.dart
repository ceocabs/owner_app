class RideHistoryModel{


  String? id;
  String? pickupAddress;
  String? dropAddress;
  dynamic pickupLoc;
  dynamic dropLoc;
  dynamic driverRatings;
  dynamic driverDetails;
  dynamic price;
  dynamic duration;
  dynamic distance;
  dynamic cashAmount;
  dynamic onlineAmount;

  RideHistoryModel({
    this.id,
    this.pickupAddress,
    this.dropAddress,
    this.pickupLoc,
    this.dropLoc,
    this.driverDetails,
    this.driverRatings,
    this.price,
    this.duration,
    this.distance,
    this.cashAmount,
    this.onlineAmount
});


  RideHistoryModel.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        pickupAddress = json['pickup_address'],
        dropAddress = json['drop_address'],
        pickupLoc = json['pickup_loc'],
        dropLoc = json['drop_loc'],
        price = json['price'],
        duration = json['duration'],
        distance = json['distance'],
        cashAmount = json['cashAmount'],
        onlineAmount = json['onlineAmount'],
        driverDetails = json['driverDetails'],
        driverRatings = json['driverRatings'];

  Map<String, dynamic> toJson() => {
    '_id': id,
    'pickup_address': pickupAddress,
    'drop_address': dropAddress,
    'pickup_loc': pickupLoc,
    'drop_loc': dropLoc,
    'price': price,
    'onlineAmount': onlineAmount,
    'cashAmount': cashAmount,
    'duration': duration,
    'distance': distance,
    'driverDetails': driverDetails,
    'driverRatings': driverRatings,
  };


}