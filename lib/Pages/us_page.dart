import 'package:newsapplication/BackEnd/fun2.dart';
import 'package:newsapplication/BackEnd/functions.dart';
import 'package:newsapplication/Components/appbar.dart';
import 'package:newsapplication/Components/search.dart';
import 'package:newsapplication/Utils/constants.dart';
import 'package:flutter/material.dart';
import '../Components/newsbox_widget.dart';
import '../Utils/colors.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: const MyAppBar(title: 'Tech', nt: 'US',),
        body: Column(
          children: [
            const Search(),
            Expanded(
              child: SizedBox(
                  width: w,
                  child: FutureBuilder<List>(
                    future: fetchNews1(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return NewsBox(
                                url: snapshot.data![index]['url'],
                                imageurl:
                                snapshot.data![index]['urlToImage'] ?? Constant.imageurl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]
                                ['description']
                                    .toString(),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ));
                    },
                  )),
            ),
          ],
        ));
  }
}