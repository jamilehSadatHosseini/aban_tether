import 'package:aban_tether_app/core/usecases/usecase.dart';
import 'package:aban_tether_app/domain/usecases/get_user_profile_usecase.dart';
import 'package:aban_tether_app/domain/usecases/update_phone_number_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/user.dart';

part 'profile_event.dart';

part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfileUseCase getProfileUseCase;
  final UpdatePhoneNumberUseCase updatePhoneUseCase;

  ProfileBloc({
    required this.getProfileUseCase,
    required this.updatePhoneUseCase,
  }) : super(ProfileInitial()) {
    on<LoadProfileEvent>(_onLoadProfile);
    on<UpdatePhoneEvent>(_onUpdatePhone);
  }

  Future<void> _onLoadProfile(
    LoadProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final result = await getProfileUseCase(NoParams());

    result.fold(
      (failure) => emit(PhoneUpdateError(failure)),
      (user) => emit(GetUserProfileSuccess(user: user)),
    );
  }

  Future<void> _onUpdatePhone(
    UpdatePhoneEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    final result = await updatePhoneUseCase(event.user);

    result.fold((failure) => emit(PhoneUpdateError(failure)), (user) {
      emit(PhoneUpdateSuccess());
      emit(GetUserProfileSuccess(user: user));
    });
  }
}
