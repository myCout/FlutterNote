import 'Book.dart';
class ModList {
  final List<ModModel> mList;
  ModList({
    this.mList,
  });

  factory ModList.fromJson(List<dynamic> parsedJson) {
    List<ModModel> list = new List<ModModel>();
    list = parsedJson.map((i)=>ModModel.fromJson(i)).toList();
    return new ModList(
        mList: list
    );
  }
}

class ModModel {
  List<Book> books;
  String clickUrl;
  String icon;
  int id;
  String intro;
  String name;
  int showMode;
  int sort;

  ModModel({this.books, this.clickUrl, this.icon, this.id, this.intro, this.name, this.showMode, this.sort});

  factory ModModel.fromJson(Map<String, dynamic> json) {
    return ModModel(
      books: json['books'] != null ? (json['books'] as List).map((i) => Book.fromJson(i)).toList() : null,
      clickUrl: json['clickUrl'],
      icon: json['icon'],
      id: json['id'],
      intro: json['intro'],
      name: json['name'],
      showMode: json['showMode'],
      sort: json['sort'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clickUrl'] = this.clickUrl;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['intro'] = this.intro;
    data['name'] = this.name;
    data['showMode'] = this.showMode;
    data['sort'] = this.sort;
    if (this.books != null) {
      data['books'] = this.books.map((v) => v.toJson()).toList();
    }
    return data;
  }
}