import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:permium_parts/core/constances/api_const.dart';

import '../../../models/user_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  static ProfileBloc get(context) => BlocProvider.of(context);
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadUserDataEvent>(_loadUserData);
  }

  final Dio dio = Dio();
  FutureOr<void> _loadUserData(event, emit) async {
    emit(LoadingData());
    if (event is LoadUserDataEvent) {
      try {
        final response = await dio.get(ApiConst.baseUrl + ApiConst.userPath,
            options: Options(headers: {
              'Authorization': 'Bearer ${event.token}',
            }));

        if (response.statusCode == 200) {
          emit(
            LoadedSuccess(
              user: UserModel.fromMap(response.data as Map<String, dynamic>),
            ),
          );
        } else {
          emit(LoadedFailure(message: response.data));
        }
      } on DioError catch (dioErr) {
        emit(LoadedFailure(message: dioErr.message.toString()));
      } catch (err) {
        emit(LoadedFailure(message: err.toString()));
      }
    }
  }
}
