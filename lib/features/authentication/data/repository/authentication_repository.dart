import '../../../../core/data/result.dart';
import '../../domain/auth_token.dart';
import '../dto/onboarding_user_option_dto.dart';
import '../dto/sign_in_dto.dart';
import '../dto/sign_up_dto.dart';

abstract class AuthenticationRepository {
  Future<Result<AuthToken>> signUp({required SignUpDTO signUpDTO});

  Future<Result<AuthToken>> signIn({required SignInDTO signInDTO});

  Future<Result<void>> updateProfile({required OnboardingUserOptionDTO onboardingUserOptionDTO});
}