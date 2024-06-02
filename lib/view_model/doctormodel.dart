class ViewdoctorMedicalModel {
  bool? status;
  List<DcotorMedicaldata>? data;

  ViewdoctorMedicalModel({this.status, this.data});

  ViewdoctorMedicalModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DcotorMedicaldata>[];
      json['data'].forEach((v) {
        data!.add(new DcotorMedicaldata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DcotorMedicaldata {
  int? id;
  int? pUserId;
  String? medicalReport;
  String? createdAt;
  String? updatedAt;

  DcotorMedicaldata(
      {this.id,
      this.pUserId,
      this.medicalReport,
      this.createdAt,
      this.updatedAt});

  DcotorMedicaldata.fromJson(Map<String, dynamic> json) {
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
