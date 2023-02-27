import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'time_slot_event.dart';

part 'time_slot_state.dart';

class TimeSlotBloc extends Bloc<TimeSlotEvent, TimeSlotState> {


  TimeSlotBloc()
      : super(const UpdateTimeSlotState()) {
    on<UpdateTimeSlotEvent>(_onUpdateTimeSlot);
    // on<UpdateMaxTimeSlotEvent>(_onUpdateMaxTimeSlot);
    // on<ConfirmTimeSlotEvent>(_onConfirmTimeSlot);
  }

  void _onUpdateTimeSlot(
      UpdateTimeSlotEvent event, Emitter<TimeSlotState> emit) {

    if (state is UpdateTimeSlotState) {
      final state = this.state as UpdateTimeSlotState;

      String? slots = event.slots ?? state.slots;
      String? min = event.min ?? state.min;


      if(slots != null && min !=null && slots != '' && min !='') {
        DateTime now = DateTime.now();
        DateTime startTime = now;
        Duration step = Duration(minutes: int.parse(min));

        List<String> timeSlots = [];
        List<String> nextDaySlots = [];
        timeSlots.add(_formatDateTime(startTime));

        int maxSlot = int.parse(slots);

        for (int i = 0; i < maxSlot; i++) {
          DateTime timeIncrement = startTime.add(step);
          if(now.day<timeIncrement.day || now.month<timeIncrement.month){
            nextDaySlots.add(_formatDateTime(timeIncrement));
          }else {
            timeSlots.add(_formatDateTime(timeIncrement));
          }
          startTime = timeIncrement;
        }

        nextDaySlots.insert(0,'Going to Next Day');
        nextDaySlots.insert(1,timeSlots.last);
        emit(UpdateTimeSlotState(
            min: min,
            slots: slots,
            timeSlots: timeSlots,
            nextDayTimeSlots: nextDaySlots
        ));
      } else {
        emit(UpdateTimeSlotState(
          slots: slots,
          min: min,
        ));
      }
    } else {
      emit(UpdateTimeSlotState(
        min: event.min,
        slots: event.slots,
      ));
    }
  }


  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mma').format(dateTime);
  }

  // void _onUpdateMaxTimeSlot(
  //     UpdateMaxTimeSlotEvent event, Emitter<TimeSlotState> emit) {
  //   if (state is UpdateTimeSlotState) {
  //     final state = this.state as UpdateTimeSlotState;
  //     emit(UpdateTimeSlotState(
  //       slots: event.slots ?? state.slots,
  //       min: event.min ?? state.min,
  //     ));
  //   } else {
  //     emit(UpdateTimeSlotState(
  //       min: event.min,
  //       slots: event.slots,
  //     ));
  //   }
  // }

  // Future<void> _onConfirmTimeSlot(
  //     ConfirmTimeSlotEvent event, Emitter<TimeSlotState> emit) async {
  //   emit(const ErrorTimeSlotState());
  //   await resetPassword(event).then((message) {
  //     if (message is String) {
  //       var body = jsonDecode(message);
  //
  //       if (body['status_code'] == '200') {
  //         // Navigator.pushReplacementNamed(event.context, LoginScreen.routeName);
  //       } else {
  //         ScaffoldMessenger.of(event.context).showSnackBar(
  //           SnackBar(
  //             backgroundColor: ColorConstants.snackBar,
  //             content: Text(
  //               body['message'],
  //               style: const TextStyle(color: ColorConstants.snackBarText),
  //             ),
  //             action: SnackBarAction(
  //               label: 'Try Again',
  //               textColor: ColorConstants.snackBarText,
  //               onPressed: () {},
  //             ),
  //             duration: const Duration(seconds: 2),
  //           ),
  //         );
  //       }
  //     }
  //     add(UpdateTimeSlotEvent(
  //       password: event.password,
  //       confirmPassword: event.confirmPassword,
  //     ));
  //   });
  // }

  Future<Object> resetPassword(ConfirmTimeSlotEvent event) async {
    // Object message = await userRepository.resetPassword(
    //     event.password, event.confirmPassword, event.userId);
    return 'message';
  }
}
