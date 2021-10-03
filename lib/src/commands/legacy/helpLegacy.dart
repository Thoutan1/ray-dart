// ignore_for_file: file_names

import "package:nyxx/nyxx.dart" show MessageBuilder;
import "package:nyxx_commander/commander.dart" show CommandContext;
import "package:ray_dart/src/commands/helpCommon.dart" show helpGenericCommand;

Future<void> helpCommand(CommandContext ctx, String content) async {
  await ctx.reply(MessageBuilder.embed(await helpGenericCommand(ctx.client, ctx.shardId)));
}