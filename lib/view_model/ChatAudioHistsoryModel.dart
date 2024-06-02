class ChatAudioHistory {
  List<ChatData>? data;

  ChatAudioHistory({this.data});

  ChatAudioHistory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ChatData>[];
      json['data'].forEach((v) {
        data!.add(new ChatData.fromJson(v));
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

class ChatData {
  int? id;
  int? pUserId;
  int? dUserId;
  String? conversationType;
  String? startDateTime;
  String? createdAt;
  String? updatedAt;

  ChatData(
      {this.id,
        this.pUserId,
        this.dUserId,
        this.conversationType,
        this.startDateTime,
        this.createdAt,
        this.updatedAt});

  ChatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pUserId = json['p_user_id'];
    dUserId = json['d_user_id'];
    conversationType = json['conversation_type'];
    startDateTime = json['start_date_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['p_user_id'] = this.pUserId;
    data['d_user_id'] = this.dUserId;
    data['conversation_type'] = this.conversationType;
    data['start_date_time'] = this.startDateTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
