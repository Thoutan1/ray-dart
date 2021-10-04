// ignore_for_file: unused_shown_name, avoid_single_cascade_in_expression_statements

// import 'dart:js';

import "package:nyxx/nyxx.dart";
import "package:nyxx_commander/commander.dart";
import "package:ray_dart/ray_dart.dart" as rod;
import 'package:dotenv/dotenv.dart' show load, clean, isEveryDefined, env;
import "package:nyxx_interactions/interactions.dart"
    show
        CommandOptionBuilder,
        CommandOptionType,
        Interactions,
        SlashCommandBuilder;

bool beforeHandler(CommandContext context) {
  if (context.author.bot) {
     return false;
   }
  if (context.channel is DMChannel) {
    context.channel.sendMessage(MessageBuilder.content(
      "The bot doesn't support direct messages, please use it on a server!",
    ));
    return false;
  }
  return true;
}

void main() {
  load();

  final bot = Nyxx("${env['BOT_TOKEN']}", GatewayIntents.allUnprivileged);
  Commander(
    bot,
    prefix: "${env['PREFIX']}",
    beforeCommandHandler: beforeHandler,
  )
    ..registerCommand("info", rod.infoCommand)
    ..registerCommand("help", rod.helpCommand)
    ..registerCommand("say", rod.sayCommand)
    ..registerCommand("serverinfo", rod.serverInfoCommand)
    ..registerCommand("ping", rod.pingCommand);
  Interactions(bot)
    //  ..registerSlashCommand(SlashCommandBuilder("say", "Say something", [CommandOptionBuilder(CommandOptionType.string, "say", "Say string")])
    //     ..registerHandler(rod.saySlashHandler))
    ..registerSlashCommand(SlashCommandBuilder("ping", "Shows bots latency", [])
      ..registerHandler(rod.pingSlashHandler))
    ..syncOnReady();
}
