class TransactionHistory {
  List<TransactionData>? data;

  TransactionHistory({this.data});

  TransactionHistory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TransactionData>[];
      json['data'].forEach((v) {
        data!.add(new TransactionData.fromJson(v));
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

class TransactionData {
  int? id;
  String? userId;
  String? planId;
  String? planName;
  String? planPrice;
  String? planMonths;
  String? planStartDate;
  String? planExpiryDate;
  int? subscriptionType;
  String? createdAt;
  String? updatedAt;

  TransactionData(
      {this.id,
      this.userId,
      this.planId,
      this.planName,
      this.planPrice,
      this.planMonths,
      this.planStartDate,
      this.planExpiryDate,
      this.subscriptionType,
      this.createdAt,
      this.updatedAt});

  TransactionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    planId = json['plan_id'];
    planName = json['plan_name'];
    planPrice = json['plan_price'];
    planMonths = json['plan_months'];
    planStartDate = json['plan_start_date'];
    planExpiryDate = json['plan_expiry_date'];
    subscriptionType = json['subscription_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['plan_id'] = this.planId;
    data['plan_name'] = this.planName;
    data['plan_price'] = this.planPrice;
    data['plan_months'] = this.planMonths;
    data['plan_start_date'] = this.planStartDate;
    data['plan_expiry_date'] = this.planExpiryDate;
    data['subscription_type'] = this.subscriptionType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
