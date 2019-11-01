import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_book/public.dart';
import 'package:flutter_book/utility/styles.dart';

class EditProfile extends StatefulWidget {
  final UserModelEntity userModel;

  const EditProfile({Key key, this.userModel}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserModelEntity model;
  List<Widget> cellList = [];
  List dataSource = [
    {'icon': 'icon0', 'name': '头像'},
    {'icon': 'icon1', 'name': '昵称'},
    {'icon': 'icon2', 'name': '性别'},
    {'icon': 'icon3', 'name': '生日'},
    {'icon': 'icon3', 'name': '签名'},
  ];
  File _image;

  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  initData() {
    this.model = widget.userModel;

    for (var item in dataSource) {
      cellList..add(getRow(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('编辑信息'),
        elevation: 0.0, //去掉navigationbar阴影
      ),
      resizeToAvoidBottomPadding: false, //输入框抵住键盘 内容不随键盘滚动
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: ListView(
//        children: cellList,
        children: <Widget>[buildHeaderCell(context)],
      ),
    );
  }

  Widget buildHeaderCell(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
          color: AppColor.blue,
          height: ScreenUtil().getHeight(60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '头像',
                style: TextStyle(
                  color: AppColor.color333,
                  fontSize: 18.0,
                  fontFamily: "Courier",
                ),
              ),
              CircleImageView(
                imgUrl: model.avatar,
                imgWidth: 20,
                imgHeight: 40,
              ),
            ],
          )),
    );
  }

  Widget getRow(Map item) {
    return GestureDetector(
      child: Container(
//        padding: EdgeInsets.all(10),
        height: 55,
        color: AppColor.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Divider(
              height: 0.0,
              indent: 0.0,
              color: AppColor.white, //line
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    item['name'],
                    style: TextStyle(
                      color: AppColor.color333,
                      fontSize: 18.0,
                      fontFamily: "Courier",
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              indent: 0.0,
              color: AppColor.line, //line
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          // cellList = List.from(cellList);
          // cellList.add(getRow(cellList.length + 1));
          // print('Row $i');
        });
      },
    );
  }

  void _showDialog(BuildContext cxt) {
    showCupertinoModalPopup<int>(
        context: cxt,
        builder: (cxt) {
          var dialog = CupertinoActionSheet(
//            title: Text("This is Title"),
            message: Text('选择图片'),
            cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(cxt, 0);
                },
                child: buildItemText('取消', AppColor.color999)),
            actions: <Widget>[
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(cxt, 1);
                    getImage(ImageSource.camera);
                  },
                  child: buildItemText('拍照', AppColor.color333)),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(cxt, 2);
                    getImage(ImageSource.gallery);
                  },
                  child: buildItemText('从手机相册选取', AppColor.color333)),
            ],
          );
          return dialog;
        });
  }

  Widget buildItemText(String title, Color titleColor) {
    return Container(
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: titleColor),
//          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future getImage(ImageSource type) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      );
      _upLoadImage(_image);
    });
  }

  _upLoadImage(File image) async {
    var base64 = await Utils.imageToBase64(image.path);
    String imageBase64 = "data:image/png;base64,$base64";
    Map<String, dynamic> jsonObject =
        await AppAPI.postUserProfile({"avatar": imageBase64});
    if (jsonObject["success"]) {
      debugPrint('status');
      UserModelEntity userModel = UserModelEntity.fromJson(jsonObject["data"]);
      debugPrint("username = ${userModel.avatar}");
      DataManager().insertUser(userModel);
      if (mounted) {
        setState(() {
          this.model = userModel;
        });
      }
    } else {
      debugPrint('操作失败');
    }
  }
}
