import 'package:flutter/material.dart';
import 'package:my_first_app/screens/home/home_controller.dart';
import 'package:my_first_app/screens/home/home_state.dart';
import 'package:my_first_app/themes/global_style.dart';
import 'package:provider/provider.dart';


class FilterByToppicScrollWidget extends StatefulWidget{
  final Function(int)  onPressed;

  const FilterByToppicScrollWidget({
    super.key,
    required this.onPressed,
  });

  @override
  _FilterByToppicScrollWidgetState createState() => _FilterByToppicScrollWidgetState();
}

class _FilterByToppicScrollWidgetState extends State<FilterByToppicScrollWidget> with SingleTickerProviderStateMixin {
    @override
  Widget build(BuildContext context) {
    final currentIndex = context.select((HomePageState state) => state.currentIndexTabbar);
    final nameOfTopic = context.select((HomePageState state) => state.listTopics);
    return SizedBox(
      height: 40,
        child: TabBar(
        onTap: (index) {
          context.read<HomePageNotifier>().changeTabState(index);
        },
        padding: EdgeInsets.only(left: 22),
        dividerColor:Colors.transparent,
        labelPadding: EdgeInsets.fromLTRB(0, 0, 12, 0),
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        indicatorColor: GlobalStyle.primaryColor,
        unselectedLabelColor: GlobalStyle.textColorBlackGray,
          tabAlignment: TabAlignment.start,
        tabs: nameOfTopic.map((String topic) {
          return Container(
            child: Tab(
              child: Padding(
                padding:EdgeInsets.all(0),
                child: Text(
                  topic,
                  style:TextStyle(
                    fontSize: GlobalStyle.fontSizeMedium,
                    color: nameOfTopic[currentIndex] == topic ? GlobalStyle.textColorBlack : GlobalStyle.textColorBlackGray,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
