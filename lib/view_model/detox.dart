class DetoxListModel {
  List<DetoxxmodelList>? data;
  bool? status;

  DetoxListModel({this.data, this.status});

  DetoxListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DetoxxmodelList>[];
      json['data'].forEach((v) {
        data!.add(new DetoxxmodelList.fromJson(v));
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

class DetoxxmodelList {
  int? id;
  String? templateName;
  String? content;
  String? createdAt;
  String? updatedAt;
  int? dUserId;

  DetoxxmodelList(
      {this.id,
      this.templateName,
      this.content,
      this.createdAt,
      this.updatedAt,
      this.dUserId});

  DetoxxmodelList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    templateName = json['template_name'];
    content = json['content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    dUserId = json['d_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['template_name'] = this.templateName;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['d_user_id'] = this.dUserId;
    return data;
  }
}
