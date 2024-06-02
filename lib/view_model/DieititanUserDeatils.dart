class UserDetails {
  int? id;
  String? name;
  String? age;
  String? mobileNo;
  String? address;
  String? qualification;
  String? totalWorkExperience;
  String? dateOfJoining;
  String? password;
  int? chatActivity;
  dynamic ? status;
  String? createdAt;
  String? updatedAt;
  String? userId;

  UserDetails(
      {this.id,
        this.name,
        this.age,
        this.mobileNo,
        this.address,
        this.qualification,
        this.totalWorkExperience,
        this.dateOfJoining,
        this.password,
        this.chatActivity,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.userId});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    mobileNo = json['mobile_no'];
    address = json['address'];
    qualification = json['qualification'];
    totalWorkExperience = json['total_work_experience'];
    dateOfJoining = json['date_of_joining'];
    password = json['password'];
    chatActivity = json['chat_activity'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['mobile_no'] = this.mobileNo;
    data['address'] = this.address;
    data['qualification'] = this.qualification;
    data['total_work_experience'] = this.totalWorkExperience;
    data['date_of_joining'] = this.dateOfJoining;
    data['password'] = this.password;
    data['chat_activity'] = this.chatActivity;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    return data;
  }
}
