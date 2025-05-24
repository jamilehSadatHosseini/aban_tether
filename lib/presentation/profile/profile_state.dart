part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class GetUserProfileSuccess extends ProfileState {
  final User user;

  const GetUserProfileSuccess({
    required this.user
  });

  @override
  List<Object?> get props => [user];
}

class PhoneUpdateSuccess extends ProfileState {}

class PhoneUpdateError extends ProfileState {
  final Failure failure;

  const PhoneUpdateError(this.failure);

  @override
  List<Object?> get props => [failure];
}
