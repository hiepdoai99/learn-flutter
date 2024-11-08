import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng Ký'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Họ và Tên',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập họ và tên',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Email',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            Text(
              'Mật khẩu',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập mật khẩu',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý logic đăng ký tại đây
                  final name = nameController.text;
                  final email = emailController.text;
                  final password = passwordController.text;

                  if (name.isEmpty || email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Vui lòng điền đầy đủ thông tin')),
                    );
                  } else {
                    print('Đăng ký thành công với: $name, $email');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Đăng ký thành công!')),
                    );
                  }
                },
                child: Text('Đăng Ký'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
