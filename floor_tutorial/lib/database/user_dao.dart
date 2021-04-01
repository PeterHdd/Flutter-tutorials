import 'package:floor/floor.dart';
import 'package:floor_tutorial/database/user.dart';

@dao
abstract class UserDAO {
  @insert
  Future<List<int>> inserUser(List<User> user);

  @Query('SELECT * FROM User')
  Future<List<User>> retrieveUsers();

  @Query('DELETE FROM User WHERE id = :id')
  Future<User?> deleteUser(int id);
}