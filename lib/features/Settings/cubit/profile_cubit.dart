import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_last_exam/core/models/Infomodel.dart';
import 'package:flutter_last_exam/features/Settings/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState()) {
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      emit(state.copyWith(status: ProfileStatus.loading));

      final uid = FirebaseAuth.instance.currentUser!.uid;

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();
      print(doc.data());
      final user = Infomodel.fromJson(doc.data()!);
      print(uid);
      print(doc.exists);
      print(doc.data());
      emit(state.copyWith(status: ProfileStatus.success, user: user));
    } catch (e, s) {
      print(e);
      print(s);

      emit(
        state.copyWith(status: ProfileStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
