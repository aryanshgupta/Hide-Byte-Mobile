import 'dart:math';

getFileSize(int size) {
  if (size <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(size) / log(1024)).floor();
  return '${(size / pow(1024, i)).toStringAsFixed(0)} ${suffixes[i]}';
}
