import 'package:flutter_last_exam/core/models/Infomodel.dart';

class ProfileState {
  final ProfileStatus status;
  final Infomodel? user;
  final String? errorMessage;

  const ProfileState({
    this.status = ProfileStatus.initial,
    this.user,
    this.errorMessage,
  });

  ProfileState copyWith({
    ProfileStatus? status,
    Infomodel? user,
    String? errorMessage,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum ProfileStatus { initial, loading, success, error }
