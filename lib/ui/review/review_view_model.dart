import 'package:flutter_location_search_app/data/model/review.dart';
import 'package:flutter_location_search_app/data/repository/review_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewViewModel extends Notifier<List<Review>> {
  final ReviewRepository _repo = ReviewRepository();

  @override
  List<Review> build() {
    return [];
  }

  Future<void> fetchReviews(double mapX, double mapY) async {
    final reviews = await _repo.getReviewsByLocation(mapX, mapY);
    state = reviews ?? [];
  }

  Future<void> addReview(String content, double mapX, double mapY) async {
    final review = Review(
      id: '',
      content: content,
      mapX: mapX,
      mapY: mapY,
      createdAt: DateTime.now(),
    );
    await _repo.addReview(review);
    await fetchReviews(mapX, mapY);
  }
}

final reviewViewModelProvider = NotifierProvider<ReviewViewModel, List<Review>>(
  () {
    return ReviewViewModel();
  },
);
