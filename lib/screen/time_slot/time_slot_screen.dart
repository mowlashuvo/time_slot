import 'package:flutter/material.dart';
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
      appBar: const CustomAppBar(
        title: '',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      width: 10.w,
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
                      style: Theme.of(context).textTheme.labelLarge,
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
                Container(
                  height: 500.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.w,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: BlocConsumer<TimeSlotBloc, TimeSlotState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        int itemCount = 0;
                        int itemCountNext = 0;

                        List<String> timeSlots = [];
                        List<String> nextDayTimeSlots = [];

                        if (state is UpdateTimeSlotState) {
                          if (state.timeSlots != null) {
                            itemCount = state.timeSlots!.length - 1;
                            itemCountNext = state.nextDayTimeSlots!.length - 1;
                            timeSlots.addAll(state.timeSlots!);
                            nextDayTimeSlots.addAll(state.nextDayTimeSlots!);
                          }
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start         End',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Flexible(
                              child: ListView.builder(
                                  itemCount: itemCount,
                                  itemBuilder: (context, index) {
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${timeSlots[index]} - ${timeSlots[index + 1]}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            itemCountNext != 0
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Going to Next Day',
                                      style:
                                          Theme.of(context).textTheme.labelLarge,
                                    ),
                                  )
                                : Container(),
                            Flexible(
                              child: ListView.builder(
                                  itemCount: itemCountNext,
                                  itemBuilder: (context, index) {
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${nextDayTimeSlots[index]} - ${nextDayTimeSlots[index + 1]}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
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

  List<Widget> timeSlotsWidget(int itemCountNext, List<String> nextDayTimeSlots, BuildContext context) {
    List<Widget> widgetList = [];

    for(int i=0; i<nextDayTimeSlots.length; i++) {
      Widget widget = Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${nextDayTimeSlots[i]} - ${nextDayTimeSlots[i + 1]}',
            style: Theme.of(context)
                .textTheme
                .titleLarge,
          ),
        ),
      );
      widgetList.add(widget);
    }

    return widgetList;
  }
}
