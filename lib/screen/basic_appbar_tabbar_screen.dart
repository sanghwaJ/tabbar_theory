import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DefaultTabController => 자동으로 TabBar Controller 주입 (Controller를 따로 주입하여 사용하는 방식이 더 자주 사용됨)
    return DefaultTabController(
      length: TABS.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BasicAppBarScreen'),
          // PreferredSize를 사용하면 TabBar를 커스텀마이징 할 수 있음
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabBar(
                  // 선택됐을 때 indicator 설정
                  indicatorColor: Colors.red,
                  indicatorWeight: 4.0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  // TabBar가 화면을 넘어가면 스크롤 할 수 있도록 설정 (default width는 TabBar 위젯의 width)
                  isScrollable: true,
                  // lable 설정
                  labelColor: Colors.yellow,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w100,
                  ),
                  tabs: TABS
                      .map(
                        (e) => Tab(
                          icon: Icon(
                            e.icon,
                          ),
                          child: Text(
                            e.label,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        // TabBarView => 선택한 TabBar를 확인할 수 있는 위젯 (DefaultTabController 하위에 TabBar와 TabBarView가 함께 있어 화면 연동이 가능함)
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(), // 스크롤 제항
          children: TABS
              .map(
                (e) => Center(
                  child: Icon(e.icon),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
