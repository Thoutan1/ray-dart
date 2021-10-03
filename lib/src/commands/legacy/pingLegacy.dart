// ignore_for_file: file_names

import "package:nyxx/nyxx.dart" show MessageBuilder;
import "package:nyxx_commander/commander.dart" show CommandContext;


Future<void> pingCommand(CommandContext ctx, String content) async {
  await ctx.reply(MessageBuilder.content("Pong"));
}