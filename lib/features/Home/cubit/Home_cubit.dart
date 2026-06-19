import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_last_exam/core/models/Homemodel.dart';
import 'package:flutter_last_exam/features/Home/cubit/Home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  DocumentSnapshot? lastDocument;

  Future<void> loadExercises({required int limit}) async {
    if (state.isLoading) return;

    if (state.exercises.isEmpty) {
      emit(HomeState(status: HomeStatus.loading));
    } else {
      emit(
        HomeState(
          status: state.status,
          exercises: state.exercises,
          isLoading: true,
        ),
      );
    }

    try {
      Query query = FirebaseFirestore.instance
          .collection('fitness')
          .limit(limit);
      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument!);
      }

      final snapshot = await query.get();

      if (snapshot.docs.isEmpty) {
        noMoreData.value = true;

        emit(
          HomeState(
            status: state.status,
            exercises: state.exercises,
            isLoading: false,
          ),
        );
        return;
      }

      lastDocument = snapshot.docs.last;

      final newExercises = snapshot.docs.map((doc) {
        return Homemodel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();

      final updatedExercises = [...state.exercises, ...newExercises];

      emit(
        HomeState(
          status: HomeStatus.success,
          exercises: updatedExercises,
          isLoading: false,
        ),
      );

      noMoreData.value = false;
    } catch (e) {
      emit(
        HomeState(
          status: HomeStatus.error,
          errorText: e.toString(),
          exercises: state.exercises,
          isLoading: false,
        ),
      );
    }
  }

  Future<void> refreshTasks() async {
    lastDocument = null;

    emit(HomeState(status: HomeStatus.initial, exercises: []));

    await loadExercises(limit: 5);
  }
}
