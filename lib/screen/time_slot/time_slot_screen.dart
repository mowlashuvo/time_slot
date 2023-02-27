import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_slot/widget/custom_appbar.dart';
import 'package:time_slot/widget/custom_text_form_field.dart';

import '../../blocs/blocs.dart';
import '../../widget/clock.dart';

class TimeSlotScreen extends StatelessWidget {
  const TimeSlotScreen({Key? key}) : super(key: key);

  static const String routeName = '/slot';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const TimeSlotScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Clock(),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Enter Duration(min)',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    CustomTextFormField(
                      title: 'Min',
                      hintText: 'Min',
                      onChanged: (value) {
                        context
                            .read<TimeSlotBloc>()
                            .add(UpdateTimeSlotEvent(min: value));
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Max Slots',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomTextFormField(
                      title: 'Slots',
                      hintText: 'Slots',
                      onChanged: (value) {
                        context
                            .read<TimeSlotBloc>()
                            .add(UpdateTimeSlotEvent(slots: value));
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 27.h,
                ),
                Container(
                  height: 526.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.w,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    child: BlocConsumer<TimeSlotBloc, TimeSlotState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        int itemCount = 0;
                        int combineCount = 0;
                        int itemCountNext = 0;

                        List<String> timeSlots = [];
                        List<String> nextDayTimeSlots = [];
                        List<String> combineTimeSlots = [];

                        if (state is UpdateTimeSlotState) {
                          if (state.timeSlots != null) {
                            itemCount = state.timeSlots!.length - 1;
                            itemCountNext = state.nextDayTimeSlots!.length - 1;
                            combineCount = itemCount + itemCountNext;
                            timeSlots.addAll(state.timeSlots!);
                            nextDayTimeSlots.addAll(state.nextDayTimeSlots!);
                            combineTimeSlots.addAll(timeSlots);
                            combineTimeSlots.addAll(nextDayTimeSlots);
                          }
                        }
                        return Column(
                          children: [
                            Text(
                              'Start         End',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25.sp),
                            ),
                            // ...timeSlots.map((e) => Text(e)),
                            Flexible(
                              child: ListView.builder(
                                  itemCount: combineCount,
                                  itemBuilder: (context, index) {
                                    return Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 5.0.w),
                                        child: Text(
                                          combineTimeSlots[index] ==
                                                  'Going to Next Day'
                                              ? 'Going to Next Day\n\n'
                                              : combineTimeSlots[index + 1] ==
                                                      'Going to Next Day'
                                                  ? ''
                                                  : '${combineTimeSlots[index]} - ${combineTimeSlots[index + 1]}',
                                          style: combineTimeSlots[index] ==
                                                  'Going to Next Day'
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(color: Colors.black, fontSize: 15.sp)
                                              : combineTimeSlots[index + 1] ==
                                                      'Going to Next Day'
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 25.sp),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> timeSlotsWidget(
      int itemCountNext, List<String> nextDayTimeSlots, BuildContext context) {
    List<Widget> widgetList = [];

    for (int i = 0; i < nextDayTimeSlots.length; i++) {
      Widget widget = Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${nextDayTimeSlots[i]} - ${nextDayTimeSlots[i + 1]}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      );
      widgetList.add(widget);
    }

    return widgetList;
  }
}
