class UserMedicalReport {
  List<UserMedicalReportdata>? data;
  bool? status;

  UserMedicalReport({this.data, this.status});

  UserMedicalReport.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserMedicalReportdata>[];
      json['data'].forEach((v) {
        data!.add(new UserMedicalReportdata.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class UserMedicalReportdata {
  int? id;
  int? pUserId;
  String? medicalReport;
  String? createdAt;
  String? updatedAt;

  UserMedicalReportdata(
      {this.id,
      this.pUserId,
      this.medicalReport,
      this.createdAt,
      this.updatedAt});

  UserMedicalReportdata.fromJson(Map<String, dynamic> json) {
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
