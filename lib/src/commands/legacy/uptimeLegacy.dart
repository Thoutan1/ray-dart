// ignore_for_file: unused_import, unused_shown_name, unused_local_variable, unnecessary_import, file_names

import "dart:math" show Random;
import "package:nyxx/nyxx.dart" show MessageBuilder, UnicodeEmoji;
import 'package:nyxx/nyxx.dart';
import "package:nyxx_commander/commander.dart" show CommandContext;

Future<void> uptimeCommand(CommandContext ctx, String content) async {
  var uptime = ctx.client.uptime;
  var day = 'Day';
  var hours = 'hours';
  var minute = 'Minute';
  var second = 'Second';
  if (uptime.inDays == 1) {
    day = 'Day';
  }
  if (uptime.inHours == 1) {
    hours = 'hours';
  }
  if (uptime.inMinutes == 1) {
    minute = 'Minute';
  }
  if (uptime.inSeconds == 1) {
    second = 'Second';
  }

  await ctx.reply(MessageBuilder.content("${uptime.inDays} $day, ${uptime.inHours} $hours, ${uptime.inMinutes} $minute ${uptime.inSeconds} $second"));
}