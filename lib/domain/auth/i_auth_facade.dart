import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_amplify/domain/auth/auth_failure.dart';
import 'package:flutter_ddd_amplify/domain/auth/user.dart';

import 'value_objects.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> confirmSignedInUser({
    required EmailAddress emailAddress,
    required ConfirmationCode confirmationCode,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> resendConfirmationCode({
    required EmailAddress emailAddress,
  });

  Future<Either<AuthFailure, Unit>> requestResetPassword({
    required EmailAddress emailAddress,
  });

  Future<Either<AuthFailure, Unit>> resetPassword({
    required EmailAddress emailAddress,
    required ConfirmationCode confirmationCode,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOut();
}
