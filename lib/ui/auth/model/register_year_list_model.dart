class RegisterYearListModel {
  dynamic id;
  dynamic year;

  RegisterYearListModel({this.id, this.year});

  factory RegisterYearListModel.fromJson(Map<String, dynamic> json) =>
      RegisterYearListModel(
        id: json["id"] == null ? null : json["id"],
        year: json["year"] == null ? null : json["year"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'year': year,
      };
}
