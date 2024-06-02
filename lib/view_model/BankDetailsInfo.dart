class BankDetailsInfo {
  int? id;
  String? upiId;
  String? bankName;
  String? accountNumber;
  String? ifcCode;
  String? qrCode;
  Null? createdAt;
  String? updatedAt;

  BankDetailsInfo(
      {this.id,
      this.upiId,
      this.bankName,
      this.accountNumber,
      this.ifcCode,
      this.qrCode,
      this.createdAt,
      this.updatedAt});

  BankDetailsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    upiId = json['upi_id'];
    bankName = json['bank_name'];
    accountNumber = json['account_number'];
    ifcCode = json['ifc_code'];
    qrCode = json['qr_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['upi_id'] = this.upiId;
    data['bank_name'] = this.bankName;
    data['account_number'] = this.accountNumber;
    data['ifc_code'] = this.ifcCode;
    data['qr_code'] = this.qrCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
