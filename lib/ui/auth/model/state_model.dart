class StateModel {
  dynamic statesId;
  String? stateName;

  StateModel({this.statesId, this.stateName});

  StateModel.fromJson(Map<String, dynamic> json)
      : statesId = json['states_id'],
        stateName = json['state_name'];

  Map<String, dynamic> toJson() => {
        'states_id': statesId,
        'state_name': stateName,
      };
}
