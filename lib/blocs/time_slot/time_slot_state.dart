part of 'time_slot_bloc.dart';

abstract class TimeSlotState extends Equatable {
  const TimeSlotState();
  @override
  List<Object?> get props => [];
}

class TimeSlotInitial extends TimeSlotState {}

class UpdateTimeSlotState extends TimeSlotState {

  final String? min;
  final String? slots;
  final List<String>? timeSlots;
  final List<String>? nextDayTimeSlots;

  const UpdateTimeSlotState({this.min, this.slots, this.timeSlots, this.nextDayTimeSlots});

  @override
  List<Object?> get props => [min, slots, timeSlots, nextDayTimeSlots];
}

class SuccessTimeSlotState extends TimeSlotState {
  final String? message;

  const SuccessTimeSlotState({this.message});

  @override
  List<Object?> get props => [message];
}

class ErrorTimeSlotState extends TimeSlotState {
  final String? message;

  const ErrorTimeSlotState({this.message});

  @override
  List<Object?> get props => [message];
}