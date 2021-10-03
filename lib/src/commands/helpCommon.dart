// ignore_for_file: file_names

import "dart:math" show Random;

import "package:nyxx/nyxx.dart"
    show Constants, DiscordColor, EmbedBuilder, Nyxx, TextChannel;

Future<EmbedBuilder> helpGenericCommand(Nyxx client, [int shardId = 0]) async {
  final color = DiscordColor.fromRgb(
      Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));

  return EmbedBuilder()
    ..color = color
    ..addAuthor((author) {
      author.name = client.self.tag;
      author.iconUrl = client.self.avatarURL();
      author.url = "https://github.com/nyxx-discord/nyxx";
    })
    ..addField(name: 'Commands', content: 'info, help', inline: true);
}
