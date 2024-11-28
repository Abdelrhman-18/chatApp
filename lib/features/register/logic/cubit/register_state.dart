part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegistersSuccess extends RegisterState {}

final class RegisterFeliuer extends RegisterState {
  final String errormessage;
  RegisterFeliuer(this.errormessage);
}

final class RegisterImage extends RegisterState {
  final File image;
  RegisterImage(this.image);
}
