import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'list_course_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillItem extends StatelessWidget {
  final Map skillItem;
  final String imgSrc;
  final String skillImgSrc;
  SkillItem(this.skillItem, this.imgSrc, this.skillImgSrc);
  // String optional = "This skill will surely accommodate your career as a special plus point.";
  // String mustHave = "98% of professionals surveyed recommended this skill";
  // String language = "% of engineers surveyed use this programming language";
  void changeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListCourseWidget(skillItem, imgSrc)),
    );
  }

  String stringFind(category) {
    switch (category) {
      case 'optional':
        return "Although not required, this skill will surely be a special plus point.";
        break;
      case 'must-learn':
        return "Almost professionals surveyed recommended this skill.";
        break;
      case 'programming language':
        return "Some engineers surveyed use this programming language.";
        break;
      case 'tool':
        return "Make sure to choose the most suitable tool to learn.";
        break;
      case 'library':
        return "Make sure to learn the compatible library with your programming language.";
        break;
      case 'framework':
        return "Make sure to learn the compatible library with your programming language.";
        break;
    }
  }

  String cateFind(category) {
    switch (category) {
      case 'optional':
        return "*Optional";
        break;
      case 'must-learn':
        return "*Must-learn";
        break;
      case 'programming language':
        return "*Programming language";
        break;
      case 'tool':
        return "*Tool";
        break;
      case 'library':
        return "*Library";
        break;
      case 'framework':
        return "*Framework";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          margin: EdgeInsets.only(
              right: ScreenUtil().setWidth(7),
              top: ScreenUtil().setHeight(18),
              left: ScreenUtil().setWidth(7),
              bottom: ScreenUtil().setHeight(2)),
          width: ScreenUtil().setWidth(149),
          height: ScreenUtil().setHeight(230),
          decoration: new BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Color(0x26454545),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: 0)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  changeScreen(context);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(9),
                    right: ScreenUtil().setWidth(9),
                    left: ScreenUtil().setWidth(9),
                  ),
                  width: ScreenUtil().setWidth(131),
                  height: ScreenUtil().setHeight(99),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(skillImgSrc),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(12),
                    bottom: ScreenUtil().setHeight(4),
                    left: ScreenUtil().setWidth(9)),
                child: Text(skillItem['name'],
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(15),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(10),
                        bottom: ScreenUtil().setHeight(5)),
                    width: ScreenUtil().setWidth(131),
                    child: Text(
                        cateFind(skillItem['category'])
                        //skillItem['category'] != "must-learn" ? skillItem == 'optional' ? optional : language : mustHave,
                        ,
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff888888),
                          fontSize: ScreenUtil().setSp(13),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                    width: ScreenUtil().setWidth(131),
                    height: skillItem['name'].length <= 17
                        ? ScreenUtil().setHeight(57)
                        : ScreenUtil().setWidth(48),
                    child: Text(stringFind(skillItem['category']),
                        overflow: TextOverflow.ellipsis,
                        maxLines: skillItem['name'].length <= 17 ? 3 : 1,
                        //skillItem['category'] != "must-learn" ? skillItem == 'optional' ? optional : language : mustHave,
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff888888),
                          fontSize: ScreenUtil().setSp(12),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ],
              ),
            ],
          )

          // child: InkWell(
          //   onTap: () {
          //     changeScreen(context);
          //   },
          //   child: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(roadMapItem['listSkill'][index]['name']),
          //       ],
          //     ),
          //   ),
          // ),
          ),
      Positioned(
        // left: ScreenUtil().setWidth(110),
        // top: ScreenUtil().setHeight(28),
        right: ScreenUtil().setWidth(10),
        bottom: ScreenUtil().setHeight(12),
        child: InkWell(
          onTap: () {
            changeScreen(context);
          },
          child: Container(
            width: ScreenUtil().setWidth(32),
            height: ScreenUtil().setHeight(32),
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/start_learn_icon.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
