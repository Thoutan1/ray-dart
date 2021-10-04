// ignore_for_file: file_names

import "dart:math" show Random;
import "package:nyxx_commander/commander.dart" show CommandContext;
import "package:nyxx/nyxx.dart" show DiscordColor, EmbedBuilder, Nyxx;
import "package:ray_dart/src/internal/utils.dart" show getColorForUserFromMember, getColorForUserFromMessage;

Future<EmbedBuilder> serverinfoGenericCommand(Nyxx client, CommandContext ctx,
    [int shardId = 0]) async {
  final color = DiscordColor.fromRgb(
      Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
  return EmbedBuilder()
    ..addAuthor((author) {
      author.name = client.self.tag;
      author.iconUrl = client.self.avatarURL();
      author.url = "https://github.com/nyxx-discord/nyxx";
    })
    ..addFooter((footer) {
      footer.text = "${ctx.guild?.id}";
    })
    ..thumbnailUrl = ctx.guild?.iconURL()
    ..color =  getColorForUserFromMessage(ctx.message)
    ..addField(name: 'Server Name', content: ctx.guild?.name, inline: true)
    ..addField(name: 'Created On', content: ctx.guild?.createdAt, inline: true)
    ..addField(
        name: 'Owner', content: "<@${ctx.guild?.owner.id}>", inline: true)
    ..addField(name: 'Server ID', content: ctx.guild?.id, inline: true)
    ..addField(name: 'Members', content: ctx.guild?.members.last);
}
