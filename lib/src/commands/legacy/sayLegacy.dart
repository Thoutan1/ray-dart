// ignore_for_file: file_names
import "dart:math" show Random;
import "package:nyxx/nyxx.dart" show MessageBuilder;
import "package:nyxx_commander/commander.dart" show CommandContext;

Future<void> sayCommand(CommandContext ctx, String content) async {
  final args = ctx.message.content.split(" ")..removeAt(0);
  if (args.isEmpty) {
    ctx.reply(MessageBuilder.content("Plis provide text"));
    return;
  }
  final query = args.join(" ");
  ctx.reply(MessageBuilder.content(query));
}
