import 'package:collection/collection.dart';

class ResponsePdf {
  final String title;
  final String url;
  final bool downloaded;
  final String path;

  ResponsePdf(
      {required this.title,
      required this.url,
      required this.downloaded,
      required this.path});

  factory ResponsePdf.fromJson(Map<String, dynamic> json) => ResponsePdf(
        title: json['title'] as String,
        url: json['url'] as String,
        downloaded: json['downloaded'] as bool,
        path: json['path'] as String,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'url': url,
        'downloaded': downloaded,
        'path': path,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponsePdf) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      title.hashCode ^ url.hashCode ^ downloaded.hashCode ^ path.hashCode;
}

List<Map<String, dynamic>> pdfData = [
  {
    "title": "Document 1",
    "url":
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
    "downloaded": false,
    "path": ""
  },
  {
    "title": "Document 2",
    "url": "https://www.orimi.com/pdf-test.pdf",
    "downloaded": false,
    "path": ""
  },
  {
    "title": "Document 3",
    "url": "https://gahp.net/wp-content/uploads/2017/09/sample.pdf",
    "downloaded": false,
    "path": ""
  },
  {
    "title": "Document 4",
    "url": "http://www.pdf995.com/samples/pdf.pdf",
    "downloaded": false,
    "path": ""
  },
  {
    "title": "Document 5",
    "url": "https://www.hq.nasa.gov/alsj/a17/A17_FlightPlan.pdf",
    "downloaded": false,
    "path": ""
  },
  {
    "title": "Document 6",
    "url":
        "https://file-examples-com.github.io/uploads/2017/10/file-sample_150kB.pdf",
    "downloaded": false,
    "path": ""
  },
  {
    "title": "Document 7",
    "url": "https://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf",
    "downloaded": false,
    "path": ""
  }
];
