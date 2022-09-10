part of 'user_cubit.dart';

enum UserStatus {
  initial,
  loading,
  loaded,
  error,
}

class UserState extends Equatable {
  final UserStatus status;
  final User user;

  final bool isOtpVerified;

  const UserState({
    required this.status,
    required this.user,
    required this.isOtpVerified,
  });

  factory UserState.initial() => UserState(
        status: UserStatus.initial,
        user: User.initial(),
        isOtpVerified: false,
      );

  @override
  List<Object> get props => [status, user, isOtpVerified];

  @override
  bool get stringify => true;

  UserState copyWith({
    UserStatus? status,
    User? user,
    bool? isOtpVerified,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
      isOtpVerified: isOtpVerified ?? this.isOtpVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status.toString(),
      'user': {
        'name': user.name,
        'token': user.token,
        'otp': user.otp,
        'phone': user.phone,
      },
      'isOtpVerified': isOtpVerified,
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      status: UserStatus.loaded,
      user: User.fromJson(map['user']),
      isOtpVerified: map['isOtpVerified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserState.fromJson(String source) =>
      UserState.fromMap(json.decode(source) as Map<String, dynamic>);
}
