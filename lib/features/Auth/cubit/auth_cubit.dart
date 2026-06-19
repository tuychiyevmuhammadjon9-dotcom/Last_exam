import 'package:bloc/bloc.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter_last_exam/features/Auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  String verificationId = "";

  AuthCubit() : super(AuthInitial());

  Future<void> signUp({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        emit(AuthLoaded());
      } else {
        emit(AuthError(errortext: 'Something went wrong !'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(errortext: e.message ?? 'Something went wrong !'));
    } catch (error) {
      emit(AuthError(errortext: 'Something went wrong !'));
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());
    print('boshalndi');
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('boshalndi');
      if (result.user != null) {
        emit(AuthLoaded());
      } else {
        emit(AuthError(errortext: 'Something went wrong !'));
        print('error keldi');
      }
    } on FirebaseAuthException catch (e) {
      print('firebaseda xato');
      emit(AuthError(errortext: e.message ?? 'Something went wrong !'));
    } catch (error) {
      print('boshqa xato');
      emit(AuthError(errortext: 'Something went wrong !'));
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(AuthPasswordResetSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(errortext: e.message ?? 'Something went wrong !'));
    } catch (error) {
      emit(AuthError(errortext: 'Something went wrong !'));
    }
  }

  Future<void> checkSmsCode({
    required String smsCode,
    required String verificationId,
  }) async {
    emit(AuthLoading());

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final result = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      if (result.user != null) {
        emit(AuthOtpSuccess());
      }
      print("success");
    } on FirebaseAuthException catch (e) {
      emit(AuthError(errortext: e.message ?? 'Something went wrong!'));
    } catch (e) {
      print("error $e");
    }
  }
}

void logOut() async {
  await FirebaseAuth.instance.signOut();
}
