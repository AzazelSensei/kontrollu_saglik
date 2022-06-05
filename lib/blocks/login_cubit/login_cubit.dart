import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kontrollu_saglik/model/user_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // ignore: missing_return
  Future<User> login(
      {@required String username, @required String password}) async {
    try {
      if (username.isEmpty || password.isEmpty)
        throw 'Geçersiz Kullanıcı Adı veya Şifre';
      emit(LoginLoading());
      final dio = Dio();
      final response = await dio.post(
        'https://monkfish-app-3qxrp.ondigitalocean.app/login',
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        emit(LoginLoaded(User.fromJson(response.data)));
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw response.statusCode;
      }
    } on DioError catch (e) {
      emit(LoginError(e.response.statusCode.toString()));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
