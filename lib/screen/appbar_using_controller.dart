import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class AppBarUsingController extends StatefulWidget {
  const AppBarUsingController({Key? key}) : super(key: key);

  @override
  State<AppBarUsingController> createState() => _AppBarUsingControllerState();
}

// TickerProviderStateMixin => Controller를 한 프레임 단위로 효율적으로 사용할 수 있도록 도와줌
class _AppBarUsingControllerState extends State<AppBarUsingController>
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
        title: Text('AppBar Using Controller'),
        bottom: TabBar(
          controller: tabController,
          tabs: TABS
              .map(
                (e) => Tab(
                  icon: Icon(e.icon),
                  child: Text(e.label),
                ),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: TABS
            .map(
              (e) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    e.icon,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (tabController.index != 0)
                        ElevatedButton(
                          onPressed: () {
                            // tabController의 index를 이용하여 이동
                            tabController.animateTo(
                              tabController.index - 1,
                            );
                          },
                          child: Text('이전'),
                        ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      if (tabController.index != TABS.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          tabController.animateTo(
                            // tabController의 index를 이용하여 이동
                            tabController.index + 1,
                          );
                        },
                        child: Text('다음'),
                      ),
                    ],
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
