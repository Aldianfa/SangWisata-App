enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  weakPassword,
  undefined,
}

class AuthExceptionHandler {
  static handleException(e) {
    final AuthResultStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;
      case "email-already-in-use":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      case "wrong-password":
        status = AuthResultStatus.wrongPassword;
        break;
      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        break;
      case "user-disabled":
        status = AuthResultStatus.userDisabled;
        break;
      case "operation-not-allowed":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "too-many-requests":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "weak-password":
        status = AuthResultStatus.weakPassword;
        break;
      default:
        status = AuthResultStatus.undefined;
    }

    return status;
  }


  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage = "Email address is already in use by another account.";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Password is invalid";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "There is no user corresponding to the given email address.";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "User has been disabled";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Email & Password accounts are not enabled";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Too many requests. Try again later.";
        break;
      case AuthResultStatus.weakPassword:
        errorMessage = "Password is too weak.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }

    return errorMessage;
  }

}