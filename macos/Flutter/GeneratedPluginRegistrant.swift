//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import package_info_plus
import speech_to_text_macos
import video_player_avfoundation
import wakelock_plus

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FLTPackageInfoPlusPlugin.register(with: registry.registrar(forPlugin: "FLTPackageInfoPlusPlugin"))
  SpeechToTextMacosPlugin.register(with: registry.registrar(forPlugin: "SpeechToTextMacosPlugin"))
  FVPVideoPlayerPlugin.register(with: registry.registrar(forPlugin: "FVPVideoPlayerPlugin"))
  WakelockPlusMacosPlugin.register(with: registry.registrar(forPlugin: "WakelockPlusMacosPlugin"))
}
