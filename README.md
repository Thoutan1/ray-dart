## Ray_dart

# F.A.Q

- Q. Whats its Ray_Dart?
- A. Ray Dart Its Discord bot write in Dart

## Installation

```dart
dart pub get
```

## Runn the bot

```dart
dart run
```

## Example commands

```dart
// ignore_for_file: file_names

import "package:nyxx/nyxx.dart" show MessageBuilder;
import "package:nyxx_commander/commander.dart" show CommandContext;


Future<void> pingCommand(CommandContext ctx, String content) async {
  await ctx.reply(MessageBuilder.content("Pong!!"));
}
```

Special thanks to Author this library [Nyxx](https://github.com/nyxx-discord)
