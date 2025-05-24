part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfileEvent extends ProfileEvent {}

class UpdatePhoneEvent extends ProfileEvent {
  final User user;

  const UpdatePhoneEvent(this.user);

  @override
  List<Object?> get props => [user];
}
