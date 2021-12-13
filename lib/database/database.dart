import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

Database database;

// ignore: non_constant_identifier_names
void create_database() async 
{
  database = await openDatabase(
    'users.db',
    version: 1,
    onCreate: (database, version) 
    async 
    {
      await database.execute(
          'CREATE TABLE users (id INTEGER PRIMARY KEY , email TEXT, password TEXT , name TEXT , phone TEXT)');
    },
    onOpen: (database) {},
  );
}

// ignore: non_constant_identifier_names
void insert_to_database(
    {@required name, @required email, @required password, @required phone}) {
  database.transaction((txn) 
  {
    txn
        .rawInsert('INSERT INTO users (name , phone , email , password) VALUES("$name","$phone","$email","$password")')
        .then((value) 
        {
      print('$value inserted successfully');
    }).catchError((error) 
    {
      print('error when inserting new record ${error.toString()}');
    });
    return null;
  });
}

// ignore: non_constant_identifier_names
Future<List<Map>> get_data({@required email, @required password}) async
 {
  create_database();
  return await database.query('users',
      where: 'email = ? AND password = ?', whereArgs: [email, password]);
}
