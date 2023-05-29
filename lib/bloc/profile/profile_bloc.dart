// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fic4_tugas_akhir_ekatalog/data/datasources/auth_datasources.dart';
import 'package:fic4_tugas_akhir_ekatalog/data/models/response/profile_response_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthDatasource authDatasource;
  ProfileBloc(
    this.authDatasource,
  ) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final result = await authDatasource.getProfile();
      emit(ProfileLoaded(profile: result));
      try {} catch (e) {
        emit(ProfileError(message: 'Network problem: ${e.toString()}'));
      }
    });
  }
}
