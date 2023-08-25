class InsuranceTypeModel {
  dynamic id;
  String? icName;
  String? status;
  dynamic cratedBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  InsuranceTypeModel(
      {this.id,
      this.icName,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.cratedBy,
      this.updatedBy,
      this.deletedAt});

  InsuranceTypeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        icName = json['ic_name'],
        status = json['status'],
        cratedBy = json['created_by'],
        updatedBy = json['updated_by'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        deletedAt = json['deleted_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'ic_name': icName,
        'status': status,
        'created_by': cratedBy,
        'updated_by': updatedBy,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };
}
