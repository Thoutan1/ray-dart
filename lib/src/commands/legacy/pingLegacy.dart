// ignore_for_file: file_names
import "dart:math" show Random;
import "package:nyxx/nyxx.dart" show MessageBuilder;
import "package:nyxx_commander/commander.dart" show CommandContext;

Future<void> pingCommand(CommandContext ctx, String content) async {
  final random = Random();
  await ctx.reply(MessageBuilder.content("Pong ${random.nextInt(100)}"));
}
