import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_last_exam/features/SetUp/cubit/Setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit() : super(const SetupState());

  void selectGender(String gender) {
    emit(state.copyWith(gender: gender));
  }

  void selectAge(double age) {
    emit(state.copyWith(age: age.toInt()));
  }

  void selectWeight(double weight) {
    emit(state.copyWith(weight: weight));
  }

  void selectHeight(double height) {
    emit(state.copyWith(height: height));
  }

  Future<void> submitSetup() async {
    await saveUserSetup(state);
    print('Firestore save success');
  }

  Future<void> saveUserSetup(SetupState state) async {
    if (state.gender == null ||
        state.age == null ||
        state.weight == null ||
        state.height == null) {
      throw ArgumentError(
        'All onboarding fields must be selected before saving.',
      );
    }

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw StateError('No authenticated user found.');
    }

    final data = {
      'gender': state.gender,
      'age': state.age,
      'weight': state.weight,
      'height': state.height,
      'createdAt': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance.collection('users').add(data);
  }
}
