import "dart:io" show Platform, ProcessInfo;
import "package:nyxx/nyxx.dart" show Message, DiscordColor, GuildMessage;
import "package:nyxx/nyxx.dart" show Nyxx;
import 'package:intl/intl.dart';

String? get envPrefix => Platform.environment["ROD_PREFIX"];
String? get envHotReload => Platform.environment["ROD_HOT_RELOAD"];
String? get envToken => Platform.environment["ROD_TOKEN"];
bool get enabledIntentFeatures =>
    Platform.environment["ROD_INTENT_FEATURES_ENABLE"] == "true";

DateTime _approxMemberCountLastAccess = DateTime.utc(2005);
int _approxMemberCount = -1;
int _approxMemberOnline = -1;

String get dartVersion {
  final platformVersion = Platform.version;
  return platformVersion.split("(").first;
}
String getCurrentDate() {
       return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
}
String getMemoryUsageString() {
  final current = (ProcessInfo.currentRss / 1024 / 1024).toStringAsFixed(2);
  final rss = (ProcessInfo.maxRss / 1024 / 1024).toStringAsFixed(2);
  return "$current/${rss}MB";
}

String getApproxMemberCount(Nyxx client) {
  if (DateTime.now().difference(_approxMemberCountLastAccess).inMinutes > 5 ||
      _approxMemberCount == -1) {
    Future(() async {
      var amc = 0;
      var amo = 0;

      for (final element in client.guilds.values) {
        final guildPreview = await element.fetchGuildPreview();

        amc += guildPreview.approxMemberCount;
        amo += guildPreview.approxOnlineMembers;
      }

      _approxMemberCount = amc;
      _approxMemberOnline = amo;
    });
  }

  if (_approxMemberCount == -1 || _approxMemberOnline == -1) {
    return "Loading...";
  }

  return "$_approxMemberOnline/$_approxMemberCount";
}

DiscordColor? getColorForUserFromMessage(Message message) {
  if (message is GuildMessage) {
    return message.member.highestRole.color;
  }

  return DiscordColor.fromInt(0x68C2AF);
}

