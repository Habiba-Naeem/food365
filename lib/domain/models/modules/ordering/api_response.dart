import 'package:food365/utils/constants.dart';
import 'package:food365/utils/exceptions.dart';

class ApiResponse {
  //bool success;
  int status;
  //String message;
  ApiResponse({
    // this.success,
     this.status,
    // this.message,
  });

  factory ApiResponse.fromJson(int statusCode) => ApiResponse(
        //success: json["success"],
        status: statusCode,
        //message: json["message"],);
      );
  Map<String, dynamic> toJson() => {
        //"success": success,
        "status": status
        //"message": message,
      };

  Exception returnException() {
    if (status == 400 || status == 500) {
      return SomethingWentWrong();
    } else if (status == 404) {
      return DatabaseNotFound();
    } else if (status == 503) {
      return ServiceUnavailable();
    } else {
      return SomethingWentWrong();
    }
  }
}
