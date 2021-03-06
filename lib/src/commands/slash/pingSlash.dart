// ignore_for_file: unused_shown_name, avoid_single_cascade_in_expression_statements, file_names

import "dart:math" show Random;

import "package:http/http.dart" as http;

import "package:nyxx/nyxx.dart" show Constants, DiscordColor, EmbedBuilder, MessageBuilder;

import "package:nyxx_interactions/interactions.dart" show InteractionEvent, SlashCommandInteractionEvent;

Future<void> pingSlashHandler(SlashCommandInteractionEvent event) async {
  final random = Random();
  final color = DiscordColor.fromRgb(random.nextInt(255), random.nextInt(255), random.nextInt(255));
  final gatewayDelayInMillis = event.client.shardManager.shards.map((e) => e.gatewayLatency.inMilliseconds).reduce((value, element) => value + element) /~ event.client.shards;

  final apiStopwatch = Stopwatch()..start();
  await http.head(Uri(scheme: "https", host: Constants.host, path: Constants.baseUri));
  final apiPing = apiStopwatch.elapsedMilliseconds;
  final stopwatch = Stopwatch()..start();

  final embed = EmbedBuilder()
    ..color = color
    ..addField(name: "Gateway latency", content: "${gatewayDelayInMillis.abs()} ms", inline: true)
    ..addField(name: "REST latency", content: "$apiPing ms", inline: true)
    ..addField(name: "Message roundup time", content: "Pending...", inline: true);

  await event.respond(MessageBuilder.embed(embed));

  embed
    ..replaceField(name: "Message roundup time", content: "${stopwatch.elapsedMilliseconds} ms", inline: true);

  await event.editOriginalResponse(MessageBuilder.embed(embed));
}