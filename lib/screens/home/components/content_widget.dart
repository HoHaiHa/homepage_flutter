import 'package:flutter/material.dart';
import 'package:my_first_app/models/news.dart';
import 'package:my_first_app/themes/global_style.dart';

class ListNews extends StatelessWidget{
  final List<News> listNews;

  const ListNews({
    super.key,
    required this.listNews,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:22, right:22, left:22),
      child: ListView.builder(
          itemCount: listNews.length,
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.all(0),
              child: NewsWidget(
              imagePath: listNews[index].imagePath,
              topic: listNews[index].topic,
              title: listNews[index].title,
              brandImagePath: listNews[index].brandImagePath,
              brandName: listNews[index].brandName,
              timePost: listNews[index].timePost,
            ),
            );

          },
        ),
    );
  }

}

class NewsWidget extends StatelessWidget{
  final String imagePath;
  final String topic;
  final String title;
  final String brandImagePath;
  final String brandName;
  final DateTime timePost;

  const NewsWidget({
    super.key,
    required this.imagePath,
    required this.topic,
    required this.title,
    required this.brandImagePath,
    required this.brandName,
    required this.timePost,
  });
  @override
  Widget build(BuildContext context) {  
    return Container(
      padding: EdgeInsets.only(top: 6,left: 6,right: 6,bottom: 22),
      width: 380,
      height: 130,
      child: Row(
        children: [
          Center(
            child: Container(
              width: 102,
              height: 102,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.hardEdge,
              child: Center(
                child: Center(
                  child: Image.network(
                    width: 102,
                    height: 102,
                    fit: BoxFit.fill,
                    imagePath,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return CircularProgressIndicator();
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: GlobalStyle.globalPadding/2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:22,
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        topic,
                        style: TextStyle(
                          fontSize: GlobalStyle.fontSizeXSmall,
                          color: GlobalStyle.textColorBlackGray,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          color: GlobalStyle.textColorBlack,
                          height: 1.7,
                          fontSize: GlobalStyle.fontSizeMedium,
                          fontFamily: 'Poppins'
                        ),
                      )
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: ClipOval(
                            child: Image.network(
                              fit: BoxFit.fill,
                              brandImagePath,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) return child;
                                return CircularProgressIndicator();
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error);
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        ConstrainedBox(
                          constraints:BoxConstraints(
                            maxWidth: 100,
                          ),
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            brandName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: GlobalStyle.textColorBlackGray,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.schedule, color: GlobalStyle.textColorBlackGray , size: 18),
                        SizedBox(width: 4),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          timeAgo(timePost),
                          style: TextStyle(
                            fontSize: GlobalStyle.fontSizeXSmall,
                            color: GlobalStyle.textColorBlackGray,
                          ),
                        ),
                        Spacer(),
                        Transform.translate(
                          offset: Offset(0, -3),
                          child: Text(
                            '...',
                            style: TextStyle(
                              letterSpacing: 1.5,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
              ),
            ),
          )
        ],
      )
    );
  }
}

String timeAgo(DateTime timePost) {
  final duration = DateTime.now().difference(timePost);
  if (duration.inDays >= 1) {
    return '${duration.inDays}d ago';
  } else if (duration.inHours >= 1) {
    return '${duration.inHours}h ago';
  } else if (duration.inMinutes >= 1) {
    return '${duration.inMinutes}m ago';
  } else {
    return 'Just now';
  }
}
