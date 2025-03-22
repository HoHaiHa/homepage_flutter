
import 'package:flutter/material.dart';
import 'package:my_first_app/screens/home/home_controller.dart';
import 'package:my_first_app/themes/global_light_theme.dart';
import 'package:my_first_app/themes/global_style.dart';
import 'package:my_first_app/screens/home/components/appbar_widget.dart';
import 'package:my_first_app/widgets/bottom_navigate_bar.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/screens/home/home_state.dart';
import 'components/content_widget.dart';
import 'components/filter_by_time_btn_widget.dart';
import 'components/filter_by_topic_scroll_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageNotifier>().initData();
    setState(() {
      print('khoi tao xong');
    });
  }

  @override
  Widget build(BuildContext context) {
    final nameOfTopic = context.select((HomePageState state) => state.listTopics);
    final listNews = context.select((HomePageState state) => state.listNews);

    return DefaultTabController(
      length: nameOfTopic.length,
      child:Scaffold(
        backgroundColor: lightTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 70,
          title: AppBarCustom(
            logoPath: GlobalStyle.logoPath,
            iconPath: GlobalStyle.iconAppbar,
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 14),
              FilterByTimeBtn(
                label1: "Latest",
                label2: "See all",
                onPressed1: () {
                  print(1);
                },
                onPressed2: () {
                  print(1);
                },
              ),
            FilterByToppicScrollWidget(
                onPressed: (int x){}
            ),
            Expanded(
              child: TabBarView(
                children: List.generate(nameOfTopic.length, (index) {
                  return ListNews(
                    listNews: index == 0
                        ? listNews
                        : listNews
                        .where((news) => news.topic == nameOfTopic[index])
                        .toList(),
                  );
                }),
              ),
            ),

          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                spreadRadius: 3,
                blurRadius: 3,
              ),
            ],
          ),
          child: CustomBottomNavigateBar(
            onItemTapped: (index) {
            },
          ),
        ),

      )

    );
  }
}
