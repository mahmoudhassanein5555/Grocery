import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import 'entities/profile_entity.dart';

abstract class PersonalDetailsRepo {
  Future<Either<Failure, ProfileEntity>> getProfile();
  Future<Either<Failure, void>> updateProfile(ProfileEntity profile);
}
