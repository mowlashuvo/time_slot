import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../blocs/blocs.dart';
import '../screen/screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final int? index;

  const CustomAppBar({Key? key, required this.title, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 60.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 15.w,),
            Image(
              width: 80.w,
              image: AssetImage('assets/images/logo.png'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0.h);
}
