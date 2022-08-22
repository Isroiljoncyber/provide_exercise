part of 'profile_cubit.dart';

@immutable
abstract class ProfileState extends Equatable{
  const ProfileState();
}

class ProfileStateInitial extends ProfileState {
  const ProfileStateInitial();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ProfileStateInProgress extends ProfileStateInitial {
  const ProfileStateInProgress();

  @override
  List<Object?> get props => [];
}

class ProfileStateOnCompleted extends ProfileStateInitial {
  const ProfileStateOnCompleted(this.listContacts);

  final List<ContactsModel> listContacts;

  @override
  List<Object?> get props => [listContacts];
}

class ProfileStateOnFiled extends ProfileStateInitial {
  const ProfileStateOnFiled(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
