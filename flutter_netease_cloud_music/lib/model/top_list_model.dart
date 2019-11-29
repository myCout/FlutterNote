import 'dart:convert' show json;

class TopListModel {
  int code;
  List<TopList> list;

  TopListModel({
    this.code,
    this.list,
  });

  factory TopListModel.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<TopList> topList = jsonRes['list'] is List ? [] : null;
    if (topList != null) {
      for (var item in jsonRes['list']) {
        if (item != null) {
          topList.add(TopList.fromJson(item));
        }
      }
    }
    return TopListModel(
      code: jsonRes['code'],
      list: topList,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'TopList': TopList,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class TopList {
  List<Object> subscribers;
  Object subscribed;
  Object creator;
  Object artists;
  List<Tracks> tracks;
  String updateFrequency;
  int backgroundCoverId;
  Object backgroundCoverUrl;
  int titleImage;
  Object titleImageUrl;
  Object englishTitle;
  bool opRecommend;
  Object recommendInfo;
  List<Object> tags;
  int subscribedCount;
  int cloudTrackCount;
  int createTime;
  bool highQuality;
  bool newImported;
  bool anonimous;
  bool ordered;
  int trackCount;
  int userId;
  int trackUpdateTime;
  int coverImgId;
  int updateTime;
  String coverImgUrl;
  int specialType;
  String commentThreadId;
  int privacy;
  int totalDuration;
  int playCount;
  int trackNumberUpdateTime;
  int adType;
  String description;
  int status;
  String name;
  int id;
  String coverImgId_str;
  String ToplistType;

  TopList({
    this.subscribers,
    this.subscribed,
    this.creator,
    this.artists,
    this.tracks,
    this.updateFrequency,
    this.backgroundCoverId,
    this.backgroundCoverUrl,
    this.titleImage,
    this.titleImageUrl,
    this.englishTitle,
    this.opRecommend,
    this.recommendInfo,
    this.tags,
    this.subscribedCount,
    this.cloudTrackCount,
    this.createTime,
    this.highQuality,
    this.newImported,
    this.anonimous,
    this.ordered,
    this.trackCount,
    this.userId,
    this.trackUpdateTime,
    this.coverImgId,
    this.updateTime,
    this.coverImgUrl,
    this.specialType,
    this.commentThreadId,
    this.privacy,
    this.totalDuration,
    this.playCount,
    this.trackNumberUpdateTime,
    this.adType,
    this.description,
    this.status,
    this.name,
    this.id,
    this.coverImgId_str,
    this.ToplistType,
  });

  factory TopList.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> subscribers = jsonRes['subscribers'] is List ? [] : null;
    if (subscribers != null) {
      for (var item in jsonRes['subscribers']) {
        if (item != null) {
          subscribers.add(item);
        }
      }
    }

    List<Tracks> tracks = jsonRes['tracks'] is List ? [] : null;
    if (tracks != null) {
      for (var item in jsonRes['tracks']) {
        if (item != null) {
          tracks.add(Tracks.fromJson(item));
        }
      }
    }

    List<Object> tags = jsonRes['tags'] is List ? [] : null;
    if (tags != null) {
      for (var item in jsonRes['tags']) {
        if (item != null) {
          tags.add(item);
        }
      }
    }
    return TopList(
      subscribers: subscribers,
      subscribed: jsonRes['subscribed'],
      creator: jsonRes['creator'],
      artists: jsonRes['artists'],
      tracks: tracks,
      updateFrequency: jsonRes['updateFrequency'],
      backgroundCoverId: jsonRes['backgroundCoverId'],
      backgroundCoverUrl: jsonRes['backgroundCoverUrl'],
      titleImage: jsonRes['titleImage'],
      titleImageUrl: jsonRes['titleImageUrl'],
      englishTitle: jsonRes['englishTitle'],
      opRecommend: jsonRes['opRecommend'],
      recommendInfo: jsonRes['recommendInfo'],
      tags: tags,
      subscribedCount: jsonRes['subscribedCount'],
      cloudTrackCount: jsonRes['cloudTrackCount'],
      createTime: jsonRes['createTime'],
      highQuality: jsonRes['highQuality'],
      newImported: jsonRes['newImported'],
      anonimous: jsonRes['anonimous'],
      ordered: jsonRes['ordered'],
      trackCount: jsonRes['trackCount'],
      userId: jsonRes['userId'],
      trackUpdateTime: jsonRes['trackUpdateTime'],
      coverImgId: jsonRes['coverImgId'],
      updateTime: jsonRes['updateTime'],
      coverImgUrl: jsonRes['coverImgUrl'],
      specialType: jsonRes['specialType'],
      commentThreadId: jsonRes['commentThreadId'],
      privacy: jsonRes['privacy'],
      totalDuration: jsonRes['totalDuration'],
      playCount: jsonRes['playCount'],
      trackNumberUpdateTime: jsonRes['trackNumberUpdateTime'],
      adType: jsonRes['adType'],
      description: jsonRes['description'],
      status: jsonRes['status'],
      name: jsonRes['name'],
      id: jsonRes['id'],
      coverImgId_str: jsonRes['coverImgId_str'],
      ToplistType: jsonRes['ToplistType'],
    );
  }

  Map<String, dynamic> toJson() => {
        'subscribers': subscribers,
        'subscribed': subscribed,
        'creator': creator,
        'artists': artists,
        'tracks': tracks,
        'updateFrequency': updateFrequency,
        'backgroundCoverId': backgroundCoverId,
        'backgroundCoverUrl': backgroundCoverUrl,
        'titleImage': titleImage,
        'titleImageUrl': titleImageUrl,
        'englishTitle': englishTitle,
        'opRecommend': opRecommend,
        'recommendInfo': recommendInfo,
        'tags': tags,
        'subscribedCount': subscribedCount,
        'cloudTrackCount': cloudTrackCount,
        'createTime': createTime,
        'highQuality': highQuality,
        'newImported': newImported,
        'anonimous': anonimous,
        'ordered': ordered,
        'trackCount': trackCount,
        'userId': userId,
        'trackUpdateTime': trackUpdateTime,
        'coverImgId': coverImgId,
        'updateTime': updateTime,
        'coverImgUrl': coverImgUrl,
        'specialType': specialType,
        'commentThreadId': commentThreadId,
        'privacy': privacy,
        'totalDuration': totalDuration,
        'playCount': playCount,
        'trackNumberUpdateTime': trackNumberUpdateTime,
        'adType': adType,
        'description': description,
        'status': status,
        'name': name,
        'id': id,
        'coverImgId_str': coverImgId_str,
        'ToplistType': ToplistType,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Tracks {
  String first;
  String second;

  Tracks({
    this.first,
    this.second,
  });

  factory Tracks.fromJson(jsonRes) => jsonRes == null
      ? null
      : Tracks(
          first: jsonRes['first'],
          second: jsonRes['second'],
        );

  Map<String, dynamic> toJson() => {
        'first': first,
        'second': second,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
