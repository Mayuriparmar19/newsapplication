import 'package:flutter/material.dart';
import 'package:newsapplication/Utils/colors.dart';
import 'package:newsapplication/Utils/text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title ;



  final String nt;
  const MyAppBar({Key? key, required this.title, required this.nt})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      elevation: 0,
      title: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boldText(text: title, size: 20, color: AppColors.primary),
              modifiedText(text: nt, size: 20, color: AppColors.lightWhite)
            ],
          )),
      centerTitle: true,
    );
  }
}