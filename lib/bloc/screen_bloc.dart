import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_authorization/api/auth.dart';
import 'package:qr_authorization/api/response_model.dart';

class ScreenBloc extends Cubit<ScreenState> {
  ScreenBloc(this.authPlink) : super(ScreenInitial()) {
    getSlugFromAuth();
  }

  final AuthPlink authPlink;

  Future getSlugFromAuth() async {
    try {
      final result = await authPlink.getSlug();

      emit(ScreenLoaded(items: result));
    } on Exception catch (e) {
      emit(ScreenError(e.toString()));
    }
  }
}

abstract class ScreenState extends Equatable {}

class ScreenInitial extends ScreenState {
  @override
  List<Object?> get props => [];
}

class ScreenLoaded extends ScreenState {
  ScreenLoaded({required this.items});

  final ResponseModel items;

  @override
  List<Object?> get props => [items];
}

class ScreenError extends ScreenState {
  ScreenError(this.errorText);

  final String errorText;

  @override
  List<Object?> get props => [errorText];
}
