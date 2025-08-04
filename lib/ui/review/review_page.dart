import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  final String placeName;

  const ReviewPage({required this.placeName});

  @override
  State<ReviewPage> createState() => ReviewPageState();
}

class ReviewPageState extends State<ReviewPage> {
  final TextEditingController controller = TextEditingController();
  final List<Map<String, dynamic>> reviews = [
    {
      "text": "이안류에 휩쓸려갈뻔 했어요",
      "date": DateTime.parse("2025-07-14 23:32:04.478149"),
    },
    {
      "text": "사람이 너무 많았어요",
      "date": DateTime.parse("2025-07-14 23:31:14.485909"),
    },
  ];

  void addReview() {
    if (controller.text.trim().isEmpty) return;
    setState(() {
      reviews.add({"text": controller.text, "date": DateTime.now()});
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.placeName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // 리뷰 목록
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(review['text'], style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4),
                      Text(
                        review['date'].toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // 리뷰 입력창
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.purple.shade50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "리뷰를 입력하세요",
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => addReview(),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.purple),
                    onPressed: addReview,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
