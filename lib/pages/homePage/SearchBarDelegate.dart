import 'package:flutter/material.dart';

const searchList = ["矿泉水瓶", "橘子皮", "硬盘", "ipad", "A4纸", "电池"];
const resultList = ["可回收物", "湿垃圾", "可回收物", "可回收物", "可回收物", "有害垃圾"];
const recentSuggest = ["矿泉水瓶", "橘子皮"];

class SearchBarDelegate extends SearchDelegate<String> {
//重写右侧的图标
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        //将搜索内容置为空
        onPressed: () => query = "",
      )
    ];
  }

//重写返回图标
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        //关闭上下文，当前页面
        onPressed: () => close(context, null));
  }

  //重写搜索结果
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      width: 600.0,
      height: 200.0,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.red[100],
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.album,
                size: 45,
                color: Colors.red,
              ),
              title: Text(
                query,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "NotoSerifSC",
                ),
              ),
              subtitle: Text(
                resultList[searchList.indexOf(query)],
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "NotoSerifSC",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionList[index].substring(query.length),
                          style: TextStyle(color: Colors.grey))
                    ]),
              ),
            ));
  }
}
