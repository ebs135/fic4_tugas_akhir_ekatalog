// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:fic4_tugas_akhir_ekatalog/data/localsources/auth_local_storage.dart';
import 'package:fic4_tugas_akhir_ekatalog/data/models/request/login_model.dart';
import 'package:fic4_tugas_akhir_ekatalog/data/models/response/login_response_model.dart';
import 'package:meta/meta.dart';

import 'package:fic4_tugas_akhir_ekatalog/data/datasources/auth_datasources.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthDatasource authDatasource;
  LoginBloc(
    this.authDatasource,
  ) : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final result = await authDatasource.login(event.loginModel);
        if (result.accessToken != '401') {
          await AuthLocalStorage().saveToken(result.accessToken);
        }
        emit(LoginLoaded(loginResponseModel: result));
      } catch (e) {
        emit(LoginError(message: e.toString()));
      }
    });
  }
}
