import 'package:flutter/material.dart';
import 'package:flutter_location_search_app/ui/widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_location_search_app/ui/review/review_view_model.dart';

class ReviewPage extends ConsumerStatefulWidget {
  final String placeName;
  final double mapX;
  final double mapY;

  const ReviewPage({
    required this.placeName,
    required this.mapX,
    required this.mapY,
    super.key,
  });

  @override
  ConsumerState<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends ConsumerState<ReviewPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 페이지 진입 시 해당 위치 리뷰 불러오기
    Future.microtask(() {
      ref
          .read(reviewViewModelProvider.notifier)
          .fetchReviews(widget.mapX, widget.mapY);
    });
  }

  void onAddReview() {
    if (controller.text.trim().isEmpty) return;
    ref
        .read(reviewViewModelProvider.notifier)
        .addReview(controller.text.trim(), widget.mapX, widget.mapY);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final reviews = ref.watch(reviewViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(removeHtmlTags(widget.placeName)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: reviews.isEmpty
                ? Center(child: Text("리뷰가 없습니다. 첫 리뷰를 남겨보세요!"))
                : ListView.builder(
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
                            Text(
                              review.content,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              review.createdAt.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
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
                      onSubmitted: (_) => onAddReview(),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.purple),
                    onPressed: onAddReview,
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
