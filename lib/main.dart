import 'dart:async';
import 'dart:io';
import 'package:dart_appwrite/dart_appwrite.dart';

// This is your Appwrite function
// It's executed each time we get a request
Future<dynamic> main(final context) async {
// Why not try the Appwrite SDK?
  //
  final client = Client()
      .setEndpoint('https://cloud.ezhardigital.com/v1')
      .setProject(Platform.environment['APPWRITE_FUNCTION_PROJECT_ID'])
      .setKey(Platform.environment['APPWRITE_API_KEY']);

  Databases databases = Databases(client);
  Future result = databases.listDocuments(
    databaseId: Platform.environment['DATABASE_ID']!,
    collectionId: Platform.environment['COLLECTION_CATEGORY_ID']!,
  );
  result.then((response) {
    print(response);
    context.log(response);
  }).catchError((error) {
    print(error.response);
    context.error(error.response);
  });

  // You can log messages to the console
  // context.log('Hello, Logs!');

  // If something goes wrong, log an error
  // context.error('Hello, Errors!');

  // The `req` object contains the request data
  // if (context.req.method == 'GET') {
  // Send a response with the res object helpers
  // `res.send()` dispatches a string back to the client
  // return context.res.send('Hello, World!');
  // }

  // `res.json()` is a handy helper for sending JSON
  // return context.res.json({
  //   'motto': 'Build like a team of hundreds_',
  //   'learn': 'https://appwrite.io/docs',
  //   'connect': 'https://appwrite.io/discord',
  //   'getInspired': 'https://builtwith.appwrite.io',
  // });
}
