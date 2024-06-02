class ViewReportModel {
  ViewMedicalLidtdataa? data;
  bool? status;

  ViewReportModel({this.data, this.status});

  ViewReportModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new ViewMedicalLidtdataa.fromJson(json['data'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class ViewMedicalLidtdataa {
  int? id;
  int? pUserId;
  String? medicalReport;
  String? createdAt;
  String? updatedAt;

  ViewMedicalLidtdataa(
      {this.id,
      this.pUserId,
      this.medicalReport,
      this.createdAt,
      this.updatedAt});

  ViewMedicalLidtdataa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pUserId = json['p_user_id'];
    medicalReport = json['medical_report'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['p_user_id'] = this.pUserId;
    data['medical_report'] = this.medicalReport;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
