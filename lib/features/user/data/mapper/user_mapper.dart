import 'package:orio_attendance_app_flutter/features/user/data/model/user_model.dart';
import 'package:orio_attendance_app_flutter/features/user/domain/entity/user_entity.dart';
import 'package:orio_attendance_app_flutter/shared/mapper/mapper.dart';

class UserMapper extends Mapper<User, UserModel> {
  @override
  User mapModeltoEntity(UserModel model) {
    User user = User(
      name: model.name,
      otp: model.otp,
      token: model.token,
      phone: model.phone,
    );
    return user;
  }
}
