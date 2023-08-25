class InsuranceCompanyModel {
  dynamic id;
  String? icName;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  InsuranceCompanyModel(
      {this.id,
      this.icName,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  InsuranceCompanyModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        icName = json['ic_name'],
        status = json['status'],
        createdBy = json['created_by'],
        updatedBy = json['updated_by'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        deletedAt = json['deleted_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'ic_name': icName,
        'status': status,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };
}
