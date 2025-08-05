// HTML 태그 제거 '<b></b>'
String removeHtmlTags(String htmlText) {
  return htmlText.replaceAll(RegExp(r'<[^>]*>'), '');
}
