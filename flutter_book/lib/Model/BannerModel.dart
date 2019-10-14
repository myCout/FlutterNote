class BannerModel {
    String adBigPic;
    String adPic;
    String adSmallPic;
    int clickId;
    int clickType;
    String clickUrl;
    int clicks;
    int createTime;
    int endTime;
    int id;
    int placeType;
    int shows;
    int sort;
    int startTime;
    String targetGeo;
    String targetOs;
    String title;
    int updateTime;

    BannerModel({this.adBigPic, this.adPic, this.adSmallPic, this.clickId, this.clickType, this.clickUrl, this.clicks, this.createTime, this.endTime, this.id, this.placeType, this.shows, this.sort, this.startTime, this.targetGeo, this.targetOs, this.title, this.updateTime});

    factory BannerModel.fromJson(Map<String, dynamic> json) {
        return BannerModel(
            adBigPic: json['adBigPic'], 
            adPic: json['adPic'], 
            adSmallPic: json['adSmallPic'], 
            clickId: json['clickId'], 
            clickType: json['clickType'], 
            clickUrl: json['clickUrl'], 
            clicks: json['clicks'], 
            createTime: json['createTime'], 
            endTime: json['endTime'], 
            id: json['id'], 
            placeType: json['placeType'], 
            shows: json['shows'], 
            sort: json['sort'], 
            startTime: json['startTime'], 
            targetGeo: json['targetGeo'], 
            targetOs: json['targetOs'], 
            title: json['title'], 
            updateTime: json['updateTime'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['adBigPic'] = this.adBigPic;
        data['adPic'] = this.adPic;
        data['adSmallPic'] = this.adSmallPic;
        data['clickId'] = this.clickId;
        data['clickType'] = this.clickType;
        data['clickUrl'] = this.clickUrl;
        data['clicks'] = this.clicks;
        data['createTime'] = this.createTime;
        data['endTime'] = this.endTime;
        data['id'] = this.id;
        data['placeType'] = this.placeType;
        data['shows'] = this.shows;
        data['sort'] = this.sort;
        data['startTime'] = this.startTime;
        data['targetGeo'] = this.targetGeo;
        data['targetOs'] = this.targetOs;
        data['title'] = this.title;
        data['updateTime'] = this.updateTime;
        return data;
    }
}