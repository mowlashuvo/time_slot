part of 'reset_password_bloc.dart';

abstract class TimeSlotEvent extends Equatable {
  const TimeSlotEvent();
  @override
  List<Object?> get props => [];
}

class UpdateTimeSlotEvent extends TimeSlotEvent {

  final String? min;
  final String? slots;

  const UpdateTimeSlotEvent({this.min, this.slots});

  @override
  List<Object?> get props => [min, slots];
}

class UpdateMaxTimeSlotEvent extends TimeSlotEvent {

  final String? min;
  final String? slots;

  const UpdateMaxTimeSlotEvent({this.min, this.slots});

  @override
  List<Object?> get props => [min, slots];
}

class ConfirmTimeSlotEvent extends TimeSlotEvent {

  final String password;
  final String confirmPassword;
  final String userId;
  final BuildContext context;

  const ConfirmTimeSlotEvent({required this.password, required this.confirmPassword, required this.userId, required this.context});

  @override
  List<Object?> get props => [password, confirmPassword, userId, context];
}
