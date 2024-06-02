class RemarksDataSpecialView {
  List<RemarksData>? data;

  RemarksDataSpecialView({this.data});

  RemarksDataSpecialView.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RemarksData>[];
      json['data'].forEach((v) {
        data!.add(new RemarksData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RemarksData {
  int? id;
  int? pUserId;
  int? dUserId;
  String? remarks;
  String? specialInstruction;
  String? remarksDate;
  String? createdAt;
  String? updatedAt;

  RemarksData(
      {this.id,
      this.pUserId,
      this.dUserId,
      this.remarks,
      this.specialInstruction,
      this.remarksDate,
      this.createdAt,
      this.updatedAt});

  RemarksData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pUserId = json['p_user_id'];
    dUserId = json['d_user_id'];
    remarks = json['remarks'];
    specialInstruction = json['special_instruction'];
    remarksDate = json['remarks_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['p_user_id'] = this.pUserId;
    data['d_user_id'] = this.dUserId;
    data['remarks'] = this.remarks;
    data['special_instruction'] = this.specialInstruction;
    data['remarks_date'] = this.remarksDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
