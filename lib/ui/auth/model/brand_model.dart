class BrandModel {
  dynamic brandsId;
  dynamic brandName;

  BrandModel({
    this.brandsId,
    this.brandName,
  });


  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    brandsId: json["brands_id"] == null ? null : json["brands_id"],
    brandName: json["brand_name"] == null ? null : json["brand_name"],
  );

  Map<String, dynamic> toJson() => {
    'brands_id': brandsId,
    'brand_name': brandName,
  };
}
