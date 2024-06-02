class ClientList {
  List<ClientData>? data;

  ClientList({this.data});

  ClientList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ClientData>[];
      json['data'].forEach((v) {
        data!.add(new ClientData.fromJson(v));
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

class ClientData {
  int? id;
  String? name;
  String? address;
  String? mobile_no;
  String? userBreak;
  String? planPrice;
  String? planMonths;
  String? planStartDate;
  String? planExpiryDate;
  int? specialDietId;
  String? dietTemplateId;

  ClientData(
      {this.id,
      this.name,
      this.address,
      this.mobile_no,
      this.userBreak,
      this.planPrice,
      this.planMonths,
      this.planStartDate,
      this.planExpiryDate,
      this.specialDietId,
      this.dietTemplateId});

  ClientData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    mobile_no = json['mobile_no'];
    userBreak = json['user_break'];
    planPrice = json['plan_price'];
    planMonths = json['plan_months'];
    planStartDate = json['plan_start_date'];
    planExpiryDate = json['plan_expiry_date'];
    specialDietId = json['special_diet_id'];
    dietTemplateId = json['diet_template_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile_no'] = this.mobile_no;
    data['user_break'] = this.userBreak;
    data['plan_price'] = this.planPrice;
    data['plan_months'] = this.planMonths;
    data['plan_start_date'] = this.planStartDate;
    data['plan_expiry_date'] = this.planExpiryDate;
    data['special_diet_id'] = this.specialDietId;
    data['diet_template_id'] = this.dietTemplateId;

    return data;
  }
}
