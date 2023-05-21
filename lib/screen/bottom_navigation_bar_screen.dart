import 'package:flutter/material.dart';

import '../const/tabs.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

// TickerProviderStateMixin => Controller를 한 프레임 단위로 효율적으로 사용할 수 있도록 도와줌
class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>
    with TickerProviderStateMixin {
  // late => 값을 나중에 정해준다는 뜻
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    // late로 지정한 변수는 값을 지정하기 전에 접근하게되면 에러가 발생하기 때문에 initState 시에 값 지정
    tabController = TabController(
      length: TABS.length,
      vsync: this,
    );

    // tabController.addListener => tabController의 값이 변경될 때마다 함수 실행
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar'),
      ),
      body: TabBarView(
        controller: tabController,
        children: TABS
            .map(
              (e) => Center(
                child: Icon(e.icon),
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true, // lable 보이기, 안보이기 설정
        showUnselectedLabels: true,
        currentIndex: tabController.index,
        type: BottomNavigationBarType.fixed, // TabBar 선택 시 확대 여부
        onTap: (index) {
          tabController.animateTo(index);
        },
        items: TABS
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(
                  e.icon,
                ),
                label: e.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
