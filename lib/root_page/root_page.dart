import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:want_and_seek/view/calendar.dart';
import 'package:want_and_seek/view/want_diary.dart';

final pageTypeProvider = StateProvider((ref) => PageType.first);

enum PageType {
  first,
  second,
}

class RootPage extends StatelessWidget {
  RootPage({Key? key}) : super(key: key);
  final List<Widget> _pageList = <Widget>[
    const WantDiaryPage(),
    const Calendar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final pageType = ref.watch(pageTypeProvider);
        final tabItems = [
          const BottomNavigationBarItem(
            label: '日記を書く',
            icon: Icon(CupertinoIcons.pencil),
          ),
          const BottomNavigationBarItem(
            label: 'カレンダーを見る',
            icon: Icon(Icons.calendar_today_outlined),
          ),
        ];
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: _pageList[pageType.index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: pageType.index,
            onTap: (index) {
              ref.read(pageTypeProvider.notifier).state =
                  PageType.values[index];
            },
            items: tabItems,
            //icon　透明化
            selectedIconTheme: const IconThemeData(opacity: 0, size: 0),
            unselectedIconTheme: const IconThemeData(opacity: 0, size: 0),
            //タブのテキスト
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
        );
      },
    );
  }
}
