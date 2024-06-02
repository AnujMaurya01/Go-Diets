class WeeklyPicture {
  List<Data>? data;

  WeeklyPicture({this.data});

  WeeklyPicture.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? chestBust;
  String? waist;
  String? hip;
  String? arms;
  String? uploadPicture;
  String? createdAt;
  String? updatedAt;
  int? pUserId;
  String? weight;

  Data(
      {this.id,
      this.chestBust,
      this.waist,
      this.hip,
      this.arms,
      this.uploadPicture,
      this.createdAt,
      this.updatedAt,
      this.pUserId,
      this.weight});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chestBust = json['chest_bust'];
    waist = json['waist'];
    hip = json['hip'];
    arms = json['arms'];
    uploadPicture = json['upload_picture'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pUserId = json['p_user_id'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chest_bust'] = this.chestBust;
    data['waist'] = this.waist;
    data['hip'] = this.hip;
    data['arms'] = this.arms;
    data['upload_picture'] = this.uploadPicture;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['p_user_id'] = this.pUserId;
    data['weight'] = this.weight;

    return data;
  }
}
