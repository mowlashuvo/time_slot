import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:time_slot/screen/screen.dart';
import 'package:time_slot/widget/custom_appbar.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OnboardScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit an App'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () => SystemNavigator.pop(),
              child: Text('Yes'),
            ),
          ],
        ),
      )) ??
          false;
    }
    final PageController controller = PageController(initialPage: 3);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                    SmoothPageIndicator(
                        controller: controller,  // PageController
                        count:  3,
                        effect:  WormEffect(

                          type: WormType.normal,
                          dotColor: Theme.of(context).primaryColorLight,
                          activeDotColor: Theme.of(context).primaryColor,
                          dotHeight: 6.66,
                          dotWidth: 6.66,
                        ),  // your preferred effect
                        onDotClicked: (index){
                        }
                    )
                  ],
                ),
                SizedBox(height: 45.h,),
                Expanded(
                  child: PageView(
                    controller: controller,
                    children: [
                      const Image(
                        width: double.infinity,
                        image: AssetImage('assets/images/onboard_logo.png'),
                      ),
                      const Image(
                        width: double.infinity,
                        image: AssetImage('assets/images/onboard_logo.png'),
                      ),
                      const Image(
                        width: double.infinity,
                        image: AssetImage('assets/images/onboard_logo.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Text(
                  'Focus on the work',
                  style:
                  Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.black, fontSize: 30.sp),
                ),

                Expanded(
                  child: Align(
                  alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 158.w,
                          height: 52.h,
                          child: Card(
                            elevation: 5,
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0.r),
                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, TimeSlotScreen.routeName);
                              },
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0.r),
                              ),
                              child: Center(
                                child: Text(
                                  'SLOTS',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 20.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 22.w,),
                        SizedBox(
                          width: 158.w,
                          height: 52.h,
                          child: Card(
                            elevation: 5,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0.r),
                              side: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, DashboardScreen.routeName);
                              },
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0.r),
                              ),
                              child: Center(
                                child: Text(
                                  'HOME',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black, fontSize: 20.sp, ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
