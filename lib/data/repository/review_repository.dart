import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_location_search_app/data/model/review.dart';

class ReviewRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // 모든 리뷰 조회
  Future<List<Review>?> getAll() async {
    try {
      final snapshot = await firestore.collection('reviews').get();
      return snapshot.docs.map((doc) {
        final map = doc.data();
        map['id'] = doc.id;
        return Review.fromJson(map);
      }).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 특정 위치 리뷰 조회
  Future<List<Review>?> getReviewsByLocation(double mapX, double mapY) async {
    try {
      final snapshot = await firestore
          .collection('reviews')
          .where('mapX', isEqualTo: mapX)
          .where('mapY', isEqualTo: mapY)
          .get();

      return snapshot.docs.map((doc) {
        final map = doc.data();
        map['id'] = doc.id;
        return Review.fromJson(map);
      }).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 리뷰 추가
  Future<bool> addReview(Review review) async {
    try {
      await firestore.collection('reviews').add({
        'content': review.content,
        'mapX': review.mapX,
        'mapY': review.mapY,
        'createdAt': review.createdAt.toIso8601String(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
