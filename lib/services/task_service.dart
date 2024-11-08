import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class TaskService {
  // Thêm phương thức fetchTasks để gọi API
  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse('https://dev-shop.gmv.vn/test/api/tasks'));

    // Kiểm tra nếu response thành công
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body); // Parse dữ liệu JSON
      return data.map((json) => Task.fromJson(json)).toList(); // Trả về danh sách task
    } else {
      throw Exception('Failed to load tasks'); // Nếu không thành công, ném lỗi
    }
  }
}
