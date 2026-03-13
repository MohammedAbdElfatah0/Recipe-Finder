import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepo) : super(RegisterInitial());

  final AuthRepo _authRepo;

  void register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    emit(RegisterLoading());
    final res = await _authRepo.register(
      email: email,
      password: password,
      fullName: fullName,
    );
    res.fold((l) => emit(RegisterFailure(l)), (r) => emit(RegisterSuccess()));
  }
}
