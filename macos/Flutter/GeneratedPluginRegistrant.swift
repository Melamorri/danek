//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import audioplayer
import audioplayers_darwin
import path_provider_macos
import shared_preferences_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  AudioplayerPlugin.register(with: registry.registrar(forPlugin: "AudioplayerPlugin"))
  AudioplayersDarwinPlugin.register(with: registry.registrar(forPlugin: "AudioplayersDarwinPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
}
