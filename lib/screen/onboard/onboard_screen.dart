import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_slot/screen/screen.dart';
import 'package:time_slot/widget/custom_appbar.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  static const String routeName = '/onboard';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OnboardScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '',
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                width: double.infinity,
                image: AssetImage('assets/images/onboard_logo.png'),
              ),
              SizedBox(height: 20.h,),
              Text(
                'Focus on the work',
                style:
                Theme.of(context).textTheme.labelLarge,
              ),

              Expanded(
                child: Align(
                alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // elevation: 0,
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          fixedSize: Size.fromHeight(52.h),
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, TimeSlotScreen.routeName);
                          },
                        child: Text(
                          'SLOTS',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(width: 30.w,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // elevation: 0,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.r),
                          ), side: const BorderSide(
                              width: 1.0,
                              color: Colors.black,
                            ),
                          fixedSize: Size.fromHeight(52.h),
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, DashboardScreen.routeName);
                        },
                        child: Text(
                          'HOME',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
