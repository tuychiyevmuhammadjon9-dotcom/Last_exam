
abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}
class AuthPasswordResetSuccess extends AuthState {}
class AuthPhoneNumberSendSuccess extends AuthState {}
class AuthOtpSuccess extends AuthState {}
final class AuthError extends AuthState {
  final String errortext;
  AuthError({required this.errortext});
}

final class AuthLoaded extends AuthState {}