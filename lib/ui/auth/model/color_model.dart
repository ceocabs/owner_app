class ColorModel {
  dynamic id;
  dynamic colorName;

  ColorModel({
    this.id,
    this.colorName,
  });



  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
        id: json["id"] == null ? null : json["id"],
        colorName: json["color_name"] == null ? null : json["color_name"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'color_name': colorName,
      };
}
