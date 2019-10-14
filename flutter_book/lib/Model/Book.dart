class Book {
    String author;
    int chapterCount;
    String chapterUpdateName;
    String cover;
    int createTime;
    int id;
    String intro;
    String name;
    int price;
    int sort;
    int state;
    int totalStar;
    int updateTime;
    int wordCount;

    Book({this.author, this.chapterCount, this.chapterUpdateName, this.cover, this.createTime, this.id, this.intro, this.name, this.price, this.sort, this.state, this.totalStar, this.updateTime, this.wordCount});

    factory Book.fromJson(Map<String, dynamic> json) {
        return Book(
            author: json['author'], 
            chapterCount: json['chapterCount'], 
            chapterUpdateName: json['chapterUpdateName'], 
            cover: json['cover'], 
            createTime: json['createTime'], 
            id: json['id'], 
            intro: json['intro'], 
            name: json['name'], 
            price: json['price'], 
            sort: json['sort'], 
            state: json['state'], 
            totalStar: json['totalStar'], 
            updateTime: json['updateTime'], 
            wordCount: json['wordCount'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['author'] = this.author;
        data['chapterCount'] = this.chapterCount;
        data['chapterUpdateName'] = this.chapterUpdateName;
        data['cover'] = this.cover;
        data['createTime'] = this.createTime;
        data['id'] = this.id;
        data['intro'] = this.intro;
        data['name'] = this.name;
        data['price'] = this.price;
        data['sort'] = this.sort;
        data['state'] = this.state;
        data['totalStar'] = this.totalStar;
        data['updateTime'] = this.updateTime;
        data['wordCount'] = this.wordCount;
        return data;
    }
}