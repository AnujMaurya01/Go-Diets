// class ProfileDetails {
//   int? id;
//   String? mobileNo;
//   String? otp;
//   String? email;
//   String? name;
//   String? age;
//   String? dateOfBirth;
//   String? gender;
//   String? address;
//   String? professional;
//   String? height;
//   String? app_token;
//   String? weight;
//   String? bloodGroup;
//   String? medicalProblem;
//   String? anyVitaminDeficiency;
//   String? parentsMedicalProblem;
//   String? vegNonVeg;
//   String? constipationProblem;
//   String? anyFoodAllergy;
//   String? eatingPattern;
//   String? earlyMorning;
//   String? breakFast;
//   String? midMorning;
//   String? lunch;
//   String? teaTime;
//   String? dinner;
//   String? sleepTime;
//   String? wakeUpTime;
//   String? lastPeriodDate;
//   String? waterIntake;
//   String? workout;
//   String? userId;
//   String? status;
//   String? step1;
//   String? step2;
//   String? step3;
//   String? profileImage;
//   String? dieticianId;
//   String? dietTemplateId;
//   String? planId;
//   String? planName;
//   String? planPrice;
//   String? planMonths;
//   String? planStartDate;
//   String? planExpiryDate;
//   String? alcoholIntake;
//   String? createdAt;
//   String? updatedAt;

//   ProfileDetails(
//       {this.id,
//       this.mobileNo,
//       this.otp,
//       this.email,
//       this.name,
//       this.age,
//       this.dateOfBirth,
//       this.app_token,
//       this.gender,
//       this.address,
//       this.professional,
//       this.height,
//       this.weight,
//       this.bloodGroup,
//       this.medicalProblem,
//       this.anyVitaminDeficiency,
//       this.parentsMedicalProblem,
//       this.vegNonVeg,
//       this.constipationProblem,
//       this.anyFoodAllergy,
//       this.eatingPattern,
//       this.earlyMorning,
//       this.breakFast,
//       this.midMorning,
//       this.lunch,
//       this.teaTime,
//       this.dinner,
//       this.sleepTime,
//       this.wakeUpTime,
//       this.lastPeriodDate,
//       this.waterIntake,
//       this.workout,
//       this.userId,
//       this.status,
//       this.step1,
//       this.step2,
//       this.step3,
//       this.profileImage,
//       this.dieticianId,
//       this.dietTemplateId,
//       this.planId,
//       this.planName,
//       this.planPrice,
//       this.planMonths,
//       this.planStartDate,
//       this.planExpiryDate,
//       this.alcoholIntake,
//       this.createdAt,
//       this.updatedAt});

//   ProfileDetails.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     mobileNo = json['mobile_no'];
//     app_token = json['app_token'];
//     otp = json['otp'];
//     email = json['email'];
//     name = json['name'];
//     age = json['age'];
//     dateOfBirth = json['date_of_birth'];
//     gender = json['gender'];
//     address = json['address'];
//     professional = json['professional'];
//     height = json['height'];
//     weight = json['weight'];
//     bloodGroup = json['blood_group'];
//     medicalProblem = json['medical_problem'];
//     anyVitaminDeficiency = json['any_vitamin_deficiency'];
//     parentsMedicalProblem = json['parents_medical_problem'];
//     vegNonVeg = json['veg_non_veg'];
//     constipationProblem = json['constipation_problem'];
//     anyFoodAllergy = json['any_food_allergy'];
//     eatingPattern = json['eating_pattern'];
//     earlyMorning = json['early_morning'];
//     breakFast = json['break_fast'];
//     midMorning = json['mid_morning'];
//     lunch = json['lunch'];
//     teaTime = json['tea_time'];
//     dinner = json['dinner'];
//     sleepTime = json['sleep_time'];
//     wakeUpTime = json['wake_up_time'];
//     lastPeriodDate = json['last_period_date'];
//     waterIntake = json['water_intake'];
//     workout = json['workout'];
//     userId = json['user_id'];
//     status = json['status'];
//     step1 = json['step_1'];
//     step2 = json['step_2'];
//     step3 = json['step_3'];
//     profileImage = json['profile_image'];
//     dieticianId = json['dietician_id'];
//     dietTemplateId = json['diet_template_id'];
//     planId = json['plan_id'];
//     planName = json['plan_name'];
//     planPrice = json['plan_price'];
//     planMonths = json['plan_months'];
//     planStartDate = json['plan_start_date'];
//     planExpiryDate = json['plan_expiry_date'];
//     alcoholIntake = json['alcohol_intake'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['mobile_no'] = this.mobileNo;
//     data['app_token'] = this.app_token;
//     data['otp'] = this.otp;
//     data['email'] = this.email;
//     data['name'] = this.name;
//     data['age'] = this.age;
//     data['date_of_birth'] = this.dateOfBirth;
//     data['gender'] = this.gender;
//     data['address'] = this.address;
//     data['professional'] = this.professional;
//     data['height'] = this.height;
//     data['weight'] = this.weight;
//     data['blood_group'] = this.bloodGroup;
//     data['medical_problem'] = this.medicalProblem;
//     data['any_vitamin_deficiency'] = this.anyVitaminDeficiency;
//     data['parents_medical_problem'] = this.parentsMedicalProblem;
//     data['veg_non_veg'] = this.vegNonVeg;
//     data['constipation_problem'] = this.constipationProblem;
//     data['any_food_allergy'] = this.anyFoodAllergy;
//     data['eating_pattern'] = this.eatingPattern;
//     data['early_morning'] = this.earlyMorning;
//     data['break_fast'] = this.breakFast;
//     data['mid_morning'] = this.midMorning;
//     data['lunch'] = this.lunch;
//     data['tea_time'] = this.teaTime;
//     data['dinner'] = this.dinner;
//     data['sleep_time'] = this.sleepTime;
//     data['wake_up_time'] = this.wakeUpTime;
//     data['last_period_date'] = this.lastPeriodDate;
//     data['water_intake'] = this.waterIntake;
//     data['workout'] = this.workout;
//     data['user_id'] = this.userId;
//     data['status'] = this.status;
//     data['step_1'] = this.step1;
//     data['step_2'] = this.step2;
//     data['step_3'] = this.step3;
//     data['profile_image'] = this.profileImage;
//     data['dietician_id'] = this.dieticianId;
//     data['diet_template_id'] = this.dietTemplateId;
//     data['plan_id'] = this.planId;
//     data['plan_name'] = this.planName;
//     data['plan_price'] = this.planPrice;
//     data['plan_months'] = this.planMonths;
//     data['plan_start_date'] = this.planStartDate;
//     data['plan_expiry_date'] = this.planExpiryDate;
//     data['alcohol_intake'] = this.alcoholIntake;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
class ProfileDetails {
  int? id;
  String? mobileNo;
  String? otp;
  String? email;
  String? name;
  String? age;
  String? dateOfBirth;
  String? gender;
  String? address;
  String? professional;
  String? height;
  String? app_token;
  String? weight;
  String? bloodGroup;
  String? medicalProblem;
  String? anyVitaminDeficiency;
  String? parentsMedicalProblem;
  String? vegNonVeg;
  String? constipationProblem;
  String? anyFoodAllergy;
  String? eatingPattern;
  String? earlyMorning;
  String? breakFast;
  String? midMorning;
  String? lunch;
  String? teaTime;
  String? dinner;
  String? sleepTime;
  String? wakeUpTime;
  String? lastPeriodDate;
  String? waterIntake;
  String? workout;
  String? userId;
  String? status;
  String? step1;
  String? step2;
  String? step3;
  String? profileImage;
  String? dieticianId;
  String? dietTemplateId;
  String? planId;
  String? planName;
  String? planPrice;
  String? planMonths;
  String? planStartDate;
  String? planExpiryDate;
  String? alcoholIntake;
  String? createdAt;
  String? updatedAt;

  ProfileDetails(
      {this.id,
      this.mobileNo,
      this.otp,
      this.email,
      this.name,
      this.age,
      this.dateOfBirth,
      this.app_token,
      this.gender,
      this.address,
      this.professional,
      this.height,
      this.weight,
      this.bloodGroup,
      this.medicalProblem,
      this.anyVitaminDeficiency,
      this.parentsMedicalProblem,
      this.vegNonVeg,
      this.constipationProblem,
      this.anyFoodAllergy,
      this.eatingPattern,
      this.earlyMorning,
      this.breakFast,
      this.midMorning,
      this.lunch,
      this.teaTime,
      this.dinner,
      this.sleepTime,
      this.wakeUpTime,
      this.lastPeriodDate,
      this.waterIntake,
      this.workout,
      this.userId,
      this.status,
      this.step1,
      this.step2,
      this.step3,
      this.profileImage,
      this.dieticianId,
      this.dietTemplateId,
      this.planId,
      this.planName,
      this.planPrice,
      this.planMonths,
      this.planStartDate,
      this.planExpiryDate,
      this.alcoholIntake,
      this.createdAt,
      this.updatedAt}) {
    // Initialize all nullable fields to empty string if they are null
    mobileNo ??= '';
    otp ??= '';
    email ??= '';
    name ??= '';
    age ??= '';
    dateOfBirth ??= '';
    gender ??= '';
    address ??= '';
    professional ??= '';
    height ??= '';
    app_token ??= '';
    weight ??= '';
    bloodGroup ??= '';
    medicalProblem ??= '';
    anyVitaminDeficiency ??= '';
    parentsMedicalProblem ??= '';
    vegNonVeg ??= '';
    constipationProblem ??= '';
    anyFoodAllergy ??= '';
    eatingPattern ??= '';
    earlyMorning ??= '';
    breakFast ??= '';
    midMorning ??= '';
    lunch ??= '';
    teaTime ??= '';
    dinner ??= '';
    sleepTime ??= '';
    wakeUpTime ??= '';
    lastPeriodDate ??= '';
    waterIntake ??= '';
    workout ??= '';
    userId ??= '';
    status ??= '';
    step1 ??= '';
    step2 ??= '';
    step3 ??= '';
    profileImage ??= '';
    dieticianId ??= '';
    dietTemplateId ??= '';
    planId ??= '';
    planName ??= '';
    planPrice ??= '';
    planMonths ??= '';
    planStartDate ??= '';
    planExpiryDate ??= '';
    alcoholIntake ??= '';
    createdAt ??= '';
    updatedAt ??= '';
  }

  ProfileDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobileNo = json['mobile_no'] ?? '';
    app_token = json['app_token'] ?? '';
    otp = json['otp'] ?? '';
    email = json['email'] ?? '';
    name = json['name'] ?? '';
    age = json['age'] ?? '';
    dateOfBirth = json['date_of_birth'] ?? '';
    gender = json['gender'] ?? '';
    address = json['address'] ?? '';
    professional = json['professional'] ?? '';
    height = json['height'] ?? '';
    weight = json['weight'] ?? '';
    bloodGroup = json['blood_group'] ?? '';
    medicalProblem = json['medical_problem'] ?? '';
    anyVitaminDeficiency = json['any_vitamin_deficiency'] ?? '';
    parentsMedicalProblem = json['parents_medical_problem'] ?? '';
    vegNonVeg = json['veg_non_veg'] ?? '';
    constipationProblem = json['constipation_problem'] ?? '';
    anyFoodAllergy = json['any_food_allergy'] ?? '';
    eatingPattern = json['eating_pattern'] ?? '';
    earlyMorning = json['early_morning'] ?? '';
    breakFast = json['break_fast'] ?? '';
    midMorning = json['mid_morning'] ?? '';
    lunch = json['lunch'] ?? '';
    teaTime = json['tea_time'] ?? '';
    dinner = json['dinner'] ?? '';
    sleepTime = json['sleep_time'] ?? '';
    wakeUpTime = json['wake_up_time'] ?? '';
    lastPeriodDate = json['last_period_date'] ?? '';
    waterIntake = json['water_intake'] ?? '';
    workout = json['workout'] ?? '';
    userId = json['user_id'] ?? '';
    status = json['status'] ?? '';
    step1 = json['step_1'] ?? '';
    step2 = json['step_2'] ?? '';
    step3 = json['step_3'] ?? '';
    profileImage = json['profile_image'] ?? '';
    dieticianId = json['dietician_id'] ?? '';
    dietTemplateId = json['diet_template_id'] ?? '';
    planId = json['plan_id'] ?? '';
    planName = json['plan_name'] ?? '';
    planPrice = json['plan_price'] ?? '';
    planMonths = json['plan_months'] ?? '';
    planStartDate = json['plan_start_date'] ?? '';
    planExpiryDate = json['plan_expiry_date'] ?? '';
    alcoholIntake = json['alcohol_intake'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile_no'] = this.mobileNo ?? '';
    data['app_token'] = this.app_token ?? '';
    data['otp'] = this.otp ?? '';
    data['email'] = this.email ?? '';
    data['name'] = this.name ?? '';
    data['age'] = this.age ?? '';
    data['date_of_birth'] = this.dateOfBirth ?? '';
    data['gender'] = this.gender ?? '';
    data['address'] = this.address ?? '';
    data['professional'] = this.professional ?? '';
    data['height'] = this.height ?? '';
    data['weight'] = this.weight ?? '';
    data['blood_group'] = this.bloodGroup ?? '';
    data['medical_problem'] = this.medicalProblem ?? '';
    data['any_vitamin_deficiency'] = this.anyVitaminDeficiency ?? '';
    data['parents_medical_problem'] = this.parentsMedicalProblem ?? '';
    data['veg_non_veg'] = this.vegNonVeg ?? '';
    data['constipation_problem'] = this.constipationProblem ?? '';
    data['any_food_allergy'] = this.anyFoodAllergy ?? '';
    data['eating_pattern'] = this.eatingPattern ?? '';
    data['early_morning'] = this.earlyMorning ?? '';
    data['break_fast'] = this.breakFast ?? '';
    data['mid_morning'] = this.midMorning ?? '';
    data['lunch'] = this.lunch ?? '';
    data['tea_time'] = this.teaTime ?? '';
    data['dinner'] = this.dinner ?? '';
    data['sleep_time'] = this.sleepTime ?? '';
    data['wake_up_time'] = this.wakeUpTime ?? '';
    data['last_period_date'] = this.lastPeriodDate ?? '';
    data['water_intake'] = this.waterIntake ?? '';
    data['workout'] = this.workout ?? '';
    data['user_id'] = this.userId ?? '';
    data['status'] = this.status ?? '';
    data['step_1'] = this.step1 ?? '';
    data['step_2'] = this.step2 ?? '';
    data['step_3'] = this.step3 ?? '';
    data['profile_image'] = this.profileImage ?? '';
    data['dietician_id'] = this.dieticianId ?? '';
    data['diet_template_id'] = this.dietTemplateId ?? '';
    data['plan_id'] = this.planId ?? '';
    data['plan_name'] = this.planName ?? '';
    data['plan_price'] = this.planPrice ?? '';
    data['plan_months'] = this.planMonths ?? '';
    data['plan_start_date'] = this.planStartDate ?? '';
    data['plan_expiry_date'] = this.planExpiryDate ?? '';
    data['alcohol_intake'] = this.alcoholIntake ?? '';
    data['created_at'] = this.createdAt ?? '';
    data['updated_at'] = this.updatedAt ?? '';
    return data;
  }
}
