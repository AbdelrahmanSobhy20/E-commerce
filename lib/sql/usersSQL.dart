import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' ;
import 'package:crypto/crypto.dart';

import 'sqlModels/users.dart';

class DatabaseHelper{
  final databaseName = 'users.db';
  // String users =
  //     "Create Table users (userId INTEGER PRIMARY KEY AUTOINCREMENT , userEmail TEXT UNIQUE , userPassword TEXT)";

  String users = "CREATE TABLE users ("
      "userId INTEGER PRIMARY KEY AUTOINCREMENT,"
      "userName TEXT,"  // Add this line to include the userName field
      "userEmail TEXT UNIQUE,"
      "userPassword TEXT"
      ")";


  Future <Database> initDB()async{
    final DatabasePath = await getDatabasesPath();
    final path = join(DatabasePath , databaseName);

    return openDatabase(path,version: 1,onCreate: (db,version)async{
      await db.execute(users);
    });
  }
  // Login Method
  Future<bool> login (Users user) async{
    final Database db = await initDB();

    var result = await db.rawQuery("select * from users where userEmail = '${user.userEmail}' AND userPassword = '${user.userPassword}'");
    if (result.length > 0){
      return true;
    }else {
      return false;
    }
  }

//Sign Up method
  Future<int> signUp(Users user) async{
    final Database db = await initDB();
    return db.insert('users', user.toMap());
  }

// // Sign Up method with password hashing
// Future<int> signUp(Users user) async {
//   final Database db = await initDB();
//
//   // Hash the password before storing it
//   String hashedPassword = hashPassword(user.userPassword);
//
//   // Create a new user with the hashed password
//   Users newUser = Users(
//     userEmail: user.userEmail,
//     userPassword: hashedPassword,
//     userName: user.userName,
//   );
//
//   return db.insert('users', newUser.toMap());
// }
//
// // Method to hash a password
// String hashPassword(String password) {
//   // Use a secure hash function like SHA-256
//   var bytes = utf8.encode(password); // Encode the password as UTF-8
//   var digest = sha256.convert(bytes); // Generate the hash
//   return digest.toString(); // Convert the hash to a string and return it
// }
}
