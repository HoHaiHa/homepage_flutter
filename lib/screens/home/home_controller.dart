import 'package:my_first_app/di/di.dart';
import 'package:my_first_app/models/news.dart';
import 'package:my_first_app/services/news_api.dart';
import 'package:my_first_app/services/topic_api.dart';
import 'package:state_notifier/state_notifier.dart';
import 'home_state.dart';

class HomePageNotifier extends StateNotifier<HomePageState> with LocatorMixin {
  HomePageNotifier() : super(HomePageState(0,[],[]));
  final _topicService = getIt<TopicService>();
  final _newsService = getIt<NewsService>();

  List<String> nameOfTopics = [];
  List<News> listNews = [];

  Future<void> initData() async{
    nameOfTopics = await _topicService.fetchTopics();
    listNews = await _newsService.fetchNews();
    state = HomePageState(0, nameOfTopics,listNews);
    print(nameOfTopics);
    print(listNews);
  }

  void changeTabState(int index) async {
    listNews = await _newsService.fetchNews();
    state = HomePageState(index, nameOfTopics,listNews);
  }
}