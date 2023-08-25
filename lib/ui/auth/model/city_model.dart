class CityModel {
  dynamic citiesId;
  dynamic stateId;
  String? cityName;

  CityModel({this.citiesId, this.cityName, this.stateId});

  CityModel.fromJson(Map<String, dynamic> json)
      : citiesId = json['cities_id'],
        stateId = json['state_id'],
        cityName = json['city_name'];

  Map<String, dynamic> toJson() => {
        'cities_id': citiesId,
        'state_id': stateId,
        'city_name': cityName,
      };
}
