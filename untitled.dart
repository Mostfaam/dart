
import 'dart:io';
main() {
var day;
var mon;
var year;
var input;
var type;
while (true) {
while (true) {
print('ادخل 1 لحساب الميلاد');
print('ادخل 2 للخروج');
input = stdin.readLineSync();
if (isNumeric(input!)) {
type = int.parse((input ?? ''));
if (type != null) {
if (type == 1) {
break;
} else if (type == 2) {
exit(0);
}
}
}
print('خطأ في الادخال');
}

while (true) {
print("الرجاء ادخل سنة ميلادك(1900-2022)");
input = stdin.readLineSync();
if (isNumeric(input!)) {
year = int.parse((input ?? ''));
if (year != null && year < 2022) {
break;
}
}
print('خطأ في الادخال');
}

while (true) {
print("الرجاء ادخل شهر ميلادك(1-12)");
input = stdin.readLineSync();
if (isNumeric(input!)) {
mon = int.parse((input ?? ''));
if (mon != null && mon > 0 && mon <= 12) {
break;
}
}
print('خطأ في الادخال');
}
final lastDayOfMonth = DateTime(year, mon, 0);

int dayOfMonth = lastDayOfMonth.day;
while (true) {
print("الرجاء ادخل يوم ميلادك(1-31)");
input = stdin.readLineSync();
if (isNumeric(input!)) {
day = int.parse((input ?? ''));
if (day != null && day > 0 && day <= dayOfMonth) {
break;
}
}
print('خطأ في الادخال');
}

var now = DateTime.now();
var dateYear =
now
    .year - year - (now.month < mon ? 1 : 0);

var dateMonth =
now.month - mon + (now.month < mon ? 12 : 0);
var dateDay = now.day -
day +
(now.month < mon ? lastDayOfMonth.day : 0);

print("$dateYear سنوات ");
print("$dateMonth أشهر ");
print("$dateDay يوم");
}
}

bool isNumeric(String s) {
if (s == null) {
return false;
}
return double.tryParse(s) != null;
}