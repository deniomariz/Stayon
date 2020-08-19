// function: timeSrt
// Author:   Denio Mariz
// Date:     19-Aug-2020
//
// Given a 'RemainTime' number of seconds, this function returns a
// string with a human readable representation of time in the form
// "2A3M1d23h3m20s", meaning "2 years, 3 months, 1 day, 23 hours,
// 3 minutes and 20 seconds". This is useful to represent the
// "time remaining" for an event. The second parameter 'showBlocks'
// says the size of the string returned in terms of "blocks" of
// time, where a "block" is each of time unit (2A, 3M, 1d,
// 23h, ...). Blocks of greather magnitude are considered first.
// If the number of blocks doesn´t represent completely the total
// time, a symbol "+" is prefixed for informing that some blocks
// of time was ommited (there is "more" time than the returned
// string actually indicates).
// Examples of returned strings:
// 2A3M, 2h52m, 2M, 2m, 2m34s, 3h4m3s, 2h20s, +3m, +1A, +2h, ...
timeStr(int RemainTime, [int showBlocks = 99]) {
  int Years = RemainTime ~/ (86400 * 365 * 30);
  RemainTime %= (86400 * 365 * 30);
  int Months = RemainTime ~/ (86400 * 30);
  RemainTime %= (86400 * 30);
  int Days = RemainTime ~/ 86400;
  RemainTime %= 86400;
  int Hours = RemainTime ~/ 3600;
  RemainTime %= 3600;
  int Minutes = RemainTime ~/ 60;
  RemainTime %= 60;
  int Seconds = RemainTime;
  var remainStr = "";
  if (Years > 0) {
    remainStr = '${Years}A ';
  }
  if (Months > 0) {
    remainStr = '${remainStr}${Months}M ';
  }
  if (Days > 0) {
    remainStr = '${remainStr}${Days}d ';
  }
  if (Hours > 0) {
    remainStr = '${remainStr}${Hours}h ';
  }
  if (Minutes > 0) {
    remainStr = '${remainStr}${Minutes}m ';
  }
  if (Seconds > 0) {
    remainStr = '${remainStr}${Seconds}s';
  }
  var arr = remainStr.split(" ");
//print( remainStr );

  if (showBlocks > arr.length) {
    showBlocks = arr.length;
  }
  var result = "";
  for (int i = 0; i < showBlocks; i++) {
    result = '${result}${arr[i]}';
  }
  if (showBlocks < arr.length) {
    result = '+${result}';
  }
  return (result);
}

void main() {
  int RemainTime = 2658 +
      62 +
      15 * 60 +
      86400 +
      3600 * 22 +
      86400 * 365 * 30 * 2 +
      3 * 86400 * 30 +
      3 * 60;
  print(RemainTime);
  print(timeStr(RemainTime, 88));
}
