import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/task_service.dart';
import 'task_detail.dart'; // Import màn hình chi tiết Task

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Danh Sách Task',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Task>>(
        future: TaskService.fetchTasks(),
        builder: (context, snapshot) {
          // Trạng thái chờ
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } 
          // Trạng thái có lỗi
          else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } 
          // Nếu có dữ liệu
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có task nào.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
          }

          final tasks = snapshot.data!;

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(
                    task.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Người thực hiện: ${task.assignee}', style: TextStyle(color: Colors.grey[700], fontSize: 16)),
                        SizedBox(height: 4),
                        Text('Ngày bắt đầu: ${task.start_at}', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                      ],
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
                  onTap: () {
                    // Điều hướng đến màn hình chi tiết của task
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetail(task: task),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
