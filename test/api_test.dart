// import 'dart:convert';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:food365/domain/services/menu_service.dart';
// // file which has the getNumberTrivia function
// import 'package:http/http.dart';
// import 'package:http/testing.dart';

// void main() {
// group('getMenuItems', () {
// 	test('returns number trivia string when http response is successful',
// 		() async {
			
// 	// Mock the API call to return a json response with http status 200 Ok //
// 	final mockHTTPClient = MockClient((request) async {
		
// 		// Create sample response of the HTTP call //
// 		final response = {
		
// 		};
// 		return Response(jsonEncode(response), 200);
// 	});
// 	// Check whether getNumberTrivia function returns
// 	// number trivia which will be a String
// 	expect(await getMenuItems(mockHTTPClient), isA<String>());
// 	});

// 	test('return error message when http response is unsuccessful', () async {
		
// 	// Mock the API call to return an
// 	// empty json response with http status 404
// 	final mockHTTPClient = MockClient((request) async {
// 		final response = {};
// 		return Response(jsonEncode(response), 404);
// 	});
// 	expect(await getMenuItems(mockHTTPClient),
// 		'Failed to fetch menu items');
// 	});
// });
// }
