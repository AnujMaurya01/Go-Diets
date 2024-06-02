// class DonDontModel {
//   List<DontListdata>? data;
//   bool? status;

//   DonDontModel({this.data, this.status});

//   DonDontModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <DontListdata>[];
//       json['data'].forEach((v) {
//         data!.add(new DontListdata.fromJson(v));
//       });
//     }
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['status'] = this.status;
//     return data;
//   }
// }

// class DontListdata {
//   int? id;
//   int? pUserId;
//   int? dUserId;
//   String? question;
//   String? answer;
//   String? createdAt;
//   String? updatedAt;

//   DontListdata(
//       {this.id,
//       this.pUserId,
//       this.dUserId,
//       this.question,
//       this.answer,
//       this.createdAt,
//       this.updatedAt});

//   DontListdata.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     pUserId = json['p_user_id'];
//     dUserId = json['d_user_id'];
//     question = json['question'];
//     answer = json['answer'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['p_user_id'] = this.pUserId;
//     data['d_user_id'] = this.dUserId;
//     data['question'] = this.question;
//     data['answer'] = this.answer;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
class DonDontModel {
  List<DontListdata>? data;
  bool? status;

  DonDontModel({this.data, this.status});

  DonDontModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DontListdata>[];
      json['data'].forEach((v) {
        data!.add(new DontListdata.fromJson(v));
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

class DontListdata {
  int? id;
  int? pUserId;
  int? dUserId;
  String? question;
  String? answer;
  String? createdAt;
  String? updatedAt;
  Dietitian? dietitian;

  DontListdata(
      {this.id,
      this.pUserId,
      this.dUserId,
      this.question,
      this.answer,
      this.createdAt,
      this.updatedAt,
      this.dietitian});

  DontListdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pUserId = json['p_user_id'];
    dUserId = json['d_user_id'];
    question = json['question'];
    answer = json['answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    dietitian = json['dietitian'] != null
        ? new Dietitian.fromJson(json['dietitian'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['p_user_id'] = this.pUserId;
    data['d_user_id'] = this.dUserId;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.dietitian != null) {
      data['dietitian'] = this.dietitian!.toJson();
    }
    return data;
  }
}

class Dietitian {
  int? id;
  String? name;

  Dietitian({
    this.id,
    this.name,
  });

  Dietitian.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;

    return data;
  }
}
