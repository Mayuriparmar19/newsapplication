import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../Utils/colors.dart';
import '../Utils/text.dart';
import 'bottom_nav_bar.dart';
import 'components_widget.dart';

class NewsBox extends StatelessWidget {
  final String imageUrl, title, time, description, url;
  const NewsBox(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.time,
      required this.description,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(children: [
      InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageUrl, url);
          },
          child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
              width: w,
              color: AppColors.black,
              child: Row(
                children: [
                  // CachedNetworkImage(
                  //   imageUrl: imageurl,
                  //   imageBuilder: (context, imageProvider) => Container(
                  //     width: 60,
                  //     height: 60,
                  //     decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //             image: imageProvider, fit: BoxFit.cover),
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.yellow),
                  //   ),
                  //   placeholder: (context, url) =>
                  //       CircularProgressIndicator(color: AppColors.primary),
                  //   errorWidget: (context, url, error) => const Icon(Icons.error),
                  // ),

                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 35,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ModifiedText(
                            color: AppColors.white, size: 16, text: title),
                        const SizedBox(height: 5),
                        ModifiedText(
                            color: AppColors.lightWhite, size: 12, text: time),
                      ],
                    ),
                  ),

                  const DividerWidget(),
                ],
              )))
    ]);
  }
}
