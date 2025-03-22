import '../../models/news.dart';

class HomePageState {
  int currentIndexTabbar = 0;
  List<News> listNews = [];
  List<String> listTopics= [];

  HomePageState(this.currentIndexTabbar, this.listTopics, this.listNews);
}