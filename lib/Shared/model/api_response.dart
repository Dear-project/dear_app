class ApiResponse<T> {
  final int? statusCode;
  final T? data;
  final String? errorMessage;

  ApiResponse({
    this.statusCode,
    this.data,
    this.errorMessage,
  });

  factory ApiResponse.success(int statusCode, T data) {
    return ApiResponse(
      statusCode: statusCode,
      data: data,
    );
  }

  factory ApiResponse.error(int statusCode, String errorMessage) {
    return ApiResponse(
      statusCode: statusCode,
      errorMessage: errorMessage,
    );
  }
}
