import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('GMV'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thanh tìm kiếm
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Tìm kiếm...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
            ),

          
            
            // Các biểu tượng nhanh
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickAction(icon: Icons.attach_money, label: 'Kiếm tiền'),
                  _buildQuickAction(icon: Icons.card_giftcard, label: 'Cashback'),
                  _buildQuickAction(icon: Icons.campaign, label: 'Chiến dịch'),
                  _buildQuickAction(icon: Icons.palette, label: 'Hạng mục'),
                ],
              ),
            ),

            // Nhiệm vụ kiếm tiền
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nhiệm vụ kiếm tiền',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Thực hiện nhiệm vụ tăng đơn nhận tiền thưởng',
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ],
                ),
              ),
            ),

            // Danh sách kiếm tiền
            _buildHorizontalList(
              context,
              title: 'Kiếm tiền',
              items: [
                'Tăng lượt bán nhận thưởng',
                'Chương trình kiếm tiền 2',
              ],
            ),

            // Danh sách chiến dịch
            _buildHorizontalList(
              context,
              title: 'Chiến dịch',
              items: [
                'Hội live hàng VN',
                'Voucher siêu sao',
              ],
            ),

            // Danh sách sản phẩm nổi bật
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Sản phẩm Viral',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 4, // Số lượng sản phẩm
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          'https://via.placeholder.com/150',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Sản phẩm $index',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('2.000.000đ'),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Hàm tạo biểu tượng nhanh
  Widget _buildQuickAction({required IconData icon, required String label}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.red.shade100,
          child: Icon(icon, color: Colors.red),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  // Hàm tạo danh sách ngang
  Widget _buildHorizontalList(BuildContext context,
      {required String title, required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Xem thêm',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: items.map((item) {
              return Container(
                width: 150,
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('1.500.009đ'),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
