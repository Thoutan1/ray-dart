// ignore_for_file: unused_shown_name, avoid_single_cascade_in_expression_statements

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

void main() {
  load();
  final bot = Nyxx("${env['BOT_TOKEN']}",
      GatewayIntents.allUnprivileged);

  Commander(bot, prefix: "?")
    ..registerCommand("info", rod.infoCommand)
    ..registerCommand("help", rod.helpCommand)
    ..registerCommand("ping", rod.pingCommand);

  Interactions(bot)
    ..registerSlashCommand(SlashCommandBuilder("ping", "Shows bots latency", [])
      ..registerHandler(rod.pingSlashHandler))
    ..syncOnReady();
}
