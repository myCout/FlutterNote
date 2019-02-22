import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder{
  final Widget widget;
  CustomRoute(this.widget):super(
      transitionDuration:const Duration(seconds:1),//置动画持续的时间，建议再1和2之间。
      pageBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2){
          return widget;
        },
     transitionsBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child){
            // return FadeTransition(//渐隐渐现过渡效果，主要设置opactiy（透明度）属性，值是0.0-1.0
            //   opacity: Tween(begin:0.0,end :1.0).animate(CurvedAnimation(//animate 动画的样式，一般使用动画曲线组件（CurvedAnimation）。curve: 设置动画的节奏，也就是常说的曲线，Flutter准备了很多节奏，通过改变动画取消可以做出很多不同的效果。
            //       parent:animation1,
            //       curve:Curves.fastOutSlowIn
            //   )),
            //   child: child,
            // );

            // return ScaleTransition(//缩放路由动画
            //     scale:Tween(begin:0.0,end:1.0).animate(CurvedAnimation(
            //       parent:animation1,
            //       curve: Curves.fastOutSlowIn
            //       )),
            //       child:child
            //   );

            // return RotationTransition(//旋转+缩放路由动画 思路是在一个路由动画里的child属性里再加入一个动画，让两个动画同时执行。
            //     turns:Tween(begin:0.0,end:1.0)
            //     .animate(CurvedAnimation(
            //       parent: animation1,
            //       curve: Curves.fastOutSlowIn
            //     )),
            //     child:ScaleTransition(
            //       scale:Tween(begin: 0.0,end:1.0)
            //       .animate(CurvedAnimation(
            //           parent: animation1,
            //           curve:Curves.fastOutSlowIn
            //       )),
            //       child: child,
            //     )
            //   );

            // 幻灯片路由动画
            return SlideTransition(//左右滑动路由动画
              position: Tween<Offset>(
                begin: Offset(-1.0, 0.0),
                end:Offset(0.0, 0.0)
              )
              .animate(CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn
              )),
              child: child,
            );
        }  
    ); 
}