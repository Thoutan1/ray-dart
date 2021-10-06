// ignore_for_file: unused_shown_name, avoid_single_cascade_in_expression_statements

import "package:nyxx/nyxx.dart";
import "package:nyxx_commander/commander.dart";
import "package:ray_dart/ray_dart.dart" as c;
import "package:ray_dart/src/internal/utils.dart" show getCurrentDate;
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

  final bot = Nyxx("${env['BOT_TOKEN']}", GatewayIntents.allUnprivileged, options: ClientOptions(guildSubscriptions: false, messageCacheSize: 10));
  bot.onReady.listen((ReadyEvent e) {
    print('${bot.self.username} Has been online [${getCurrentDate()}]!');
  });
  Commander(
    bot,
    prefix: "${env['PREFIX']}",
    beforeCommandHandler: beforeHandler,
  )
    ..registerCommand("info", c.infoCommand)
    ..registerCommand("help", c.helpCommand)
    ..registerCommand("say", c.sayCommand)
    ..registerCommand("uptime", c.uptimeCommand)
    ..registerCommand("serverinfo", c.serverInfoCommand)
    ..registerCommand("ping", c.pingCommand);
  Interactions(bot)
    //  ..registerSlashCommand(SlashCommandBuilder("say", "Say something", [CommandOptionBuilder(CommandOptionType.string, "say", "Say string")])
    //     ..registerHandler(c.saySlashHandler))
    ..registerSlashCommand(SlashCommandBuilder("ping", "Shows bots latency", [])
      ..registerHandler(c.pingSlashHandler))
    ..syncOnReady();
}
