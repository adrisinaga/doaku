import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:doaku/core/cubit/auth/auth_event.dart';
import 'package:doaku/core/cubit/auth/auth_state.dart';
import 'package:doaku/core/model/login_model.dart';
import 'package:doaku/core/service/services.dart';
import 'package:doaku/helper/shared_preferences.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthUninitialized());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event,) async* {
    if (event is AppStarted) {
      final isAuthenticated = await SharedPreferencesHelper.isAuthenticated();
      await Future.delayed(Duration(seconds: 3));
      if (isAuthenticated) {
        var account = authModelFromJson(await SharedPreferencesHelper.getAccount());
        yield AuthAuthenticated(role: '');
      } else {
        print('AuthUnauthenticated');
        yield AuthUnauthenticated();
      }
    }

    if (event is Login){
      yield AuthLoading();
      try {
        var response = await LoginService.login(event.username, event.password);
        // await SharedPreferencesHelper.setApiToken(response.accessToken);
        await SharedPreferencesHelper.setAccount(jsonEncode(response.value?.toJson()));
        await SharedPreferencesHelper.setAuthenticated(true);

        yield AuthLoginSuccess(loginModel: response.value);
        print('yesss');
      } catch (error) {
        yield AuthLoginFailed(errorMessage: error.toString());
        print(error.toString());
      }
    }

    if(event is Logout){
      yield AuthLoading();
      try{
        SharedPreferencesHelper.clear();
        yield AuthLogoutSuccess();
      }catch(error){
        yield AuthLogoutFailed(errorMessage: error.toString());
      }
    }

    // if (event is CheckAccount) {
    //   yield AuthLoading();
    //   try {
    //     if(event.username != null) {
    //       await api.checkUsername(username: event.username);
    //       yield AccountAvailable(data: "username");
    //     } else if(event.email != null) {
    //       await api.checkEmail(email: event.email);
    //       yield AccountAvailable(data: "email");
    //     } else if(event.phoneNumber != null) {
    //       await api.checkPhoneNumber(phoneNumber: event.phoneNumber);
    //       yield AccountAvailable(data: "phoneNumber");
    //     }
    //   } catch (error) {
    //     print("ERROR: $error");
    //     yield AuthFailure(error: error.toString());
    //   }
    // }
    //
    // if (event is Register) {
    //   yield AuthLoading();
    //   try {
    //     await api.register(data: event.data);
    //     yield RegisterSuccess();
    //   } catch (error) {
    //     print("ERROR: $error");
    //     yield AuthFailure(error: error.toString());
    //   }
    // }
    //
    // if (event is LoadProfileInfo) {
    //   yield AuthLoading();
    //   try {
    //     var json = await SharedPreferencesHelper.getAccount();
    //     if(json != null) {
    //       var account = accountFromMap(json);
    //       yield ProfileInfoLoaded(data: account);
    //     }
    //     final response = await api.getProfile();
    //     if(response.typeUser == "Klien") {
    //       final mood = await api.mood();
    //       response.mood = mood;
    //     }
    //     yield ProfileInfoLoaded(data: response);
    //   } catch (error) {
    //     print("ERROR: $error");
    //     yield AuthFailure(error: error.toString());
    //   }
    // }
    //
    // if (event is Logout) {
    //   yield AuthLoading();
    //   FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    //   _firebaseMessaging.unsubscribeFromTopic("mood");
    //   _firebaseMessaging.unsubscribeFromTopic("public");
    //   _firebaseMessaging.unsubscribeFromTopic("article");
    //   try {
    //     var account = accountFromMap(await SharedPreferencesHelper.getAccount());
    //     _firebaseMessaging.unsubscribeFromTopic(account?.username ?? "");
    //     SharedPreferencesHelper.clear();
    //     yield AuthUnauthenticated();
    //   } catch (error) {
    //     SharedPreferencesHelper.clear();
    //     yield AuthUnauthenticated();
    //   }
    // }

  }
}