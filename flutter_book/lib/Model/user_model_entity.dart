class UserModelEntity {
  dynamic birthday;
  int sex;
  String nickname;
  String sign;
  int expiration;
  int id;
  String avatar;
  String token;

  UserModelEntity(
      {this.birthday,
      this.sex,
      this.nickname,
      this.sign,
      this.expiration,
      this.id,
      this.avatar,
      this.token});

  UserModelEntity.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    sex = json['sex'];
    nickname = json['nickname'];
    sign = json['sign'];
    expiration = json['expiration'];
    id = json['id'];
    avatar = json['avatar'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthday'] = this.birthday;
    data['sex'] = this.sex;
    data['nickname'] = this.nickname;
    data['sign'] = this.sign;
    data['expiration'] = this.expiration;
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['token'] = this.token;
    return data;
  }
}
