import 'package:flutter/cupertino.dart';
import 'package:flutter_last_exam/core/models/Homemodel.dart';

class HomeState {
  final String? errorText;
  final bool isLoading;
  final List<Homemodel> exercises;
  final HomeStatus status;
  HomeState({
    this.status = HomeStatus.initial,
    this.errorText,
    this.exercises = const [
     
    ],
    this.isLoading = false,
  });
}

enum HomeStatus { initial, loading, error, success }

ValueNotifier<bool> noMoreData = ValueNotifier(false);
