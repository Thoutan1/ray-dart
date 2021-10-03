// ignore_for_file: file_names

import "dart:math" show Random;

import "package:nyxx/nyxx.dart" show Constants, DiscordColor, EmbedBuilder, Nyxx, TextChannel;
import "package:ray_dart/src/internal/utils.dart" show dartVersion, getApproxMemberCount, getMemoryUsageString;

Future<EmbedBuilder> infoGenericCommand(Nyxx client, [int shardId = 0]) async {
  final color = DiscordColor.fromRgb(
      Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));

  return EmbedBuilder()
    ..addAuthor((author) {
      author.name = client.self.tag;
      author.iconUrl = client.self.avatarURL();
      author.url = "https://github.com/nyxx-discord/nyxx";
    })
    ..addFooter((footer) {
      footer.text = "Nyxx ${Constants.version} | Shard [${shardId + 1}] of [${client.shards}]";
    })
    ..color = color
    ..addField(name: "Cached guilds", content: client.guilds.count, inline: true)
    ..addField(name: "Cached users", content: client.users.count, inline: true)
    ..addField(
        name: "Cached channels",
        content: client.channels.count,
        inline: true
    )
    ..addField(
        name: "Cached voice states",
        content: client.guilds.values
            .map((g) => g.voiceStates.count)
            .reduce((f, s) => f + s),
        inline: true
    )
    ..addField(
        name: "Shard count",
        content: client.shards,
        inline: true
    )
    ..addField(
        name: "Cached messages",
        content: client.channels.find((item) => item is TextChannel).cast<TextChannel>().map((e) => e.messageCache.count).fold(0, (first, second) => (first as int) + second),
        inline: true
    )
    ..addField(
        name: "Memory usage (current/RSS)",
        content: getMemoryUsageString(),
        inline: true
    )
    ..addField(
      name: "Dart Version",
      content: dartVersion,
      inline: true
    )
    ..addField(
        name: "Member count (online/total)",
        content: getApproxMemberCount(client),
        inline: true
    );
}