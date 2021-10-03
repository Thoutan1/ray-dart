// ignore_for_file: file_names

import "package:nyxx/nyxx.dart" show MessageBuilder;
import "package:nyxx_commander/commander.dart" show CommandContext;
import "package:ray_dart/src/commands/svrinfoCommon.dart" show serverinfoGenericCommand;

Future<void> serverInfoCommand(CommandContext ctx, String content) async {
  await ctx.reply(MessageBuilder.embed(await serverinfoGenericCommand(ctx.client, ctx)));
}