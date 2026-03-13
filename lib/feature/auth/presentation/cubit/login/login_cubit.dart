import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(LoginInitial());

  final AuthRepo _authRepo;

  Future<void> signIn({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await _authRepo.signIn(email: email, password: password);
    result.fold((l) => emit(LoginFailure(l)), (r) => emit(LoginSuccess()));
  }
}
