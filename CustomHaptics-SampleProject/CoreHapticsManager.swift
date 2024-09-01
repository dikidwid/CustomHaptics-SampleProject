//
//  CoreHapticsManager.swift
//  CustomHaptics-SampleProject
//
//  Created by Diki Dwi Diro on 31/08/24.
//

import Foundation
import CoreHaptics
import AVFAudio

enum HapticPattern {
    case rain, water
    case dirt, grass
    case accousticGuitar, banjo
    
    var text: String {
        switch self {
        case .rain:
            "rain.continuous"
        case .water:
            "water.continuous"
        case .dirt:
            "dirt.continuous"
        case .grass:
            "grass.continuous"
        case .accousticGuitar:
            "acoustic_guitar.continuous"
        case .banjo:
            "banjo.continuous"
        }
    }
}

class CoreHapticsManager {
    static var shared: CoreHapticsManager = CoreHapticsManager()
    var engine: CHHapticEngine?
    
    init() {
        // Create and configure a haptic engine.
        do {
            // Associate the haptic engine with the default audio session
            // to ensure the correct behavior when playing audio-based haptics.
            let audioSession = AVAudioSession.sharedInstance()
            engine = try CHHapticEngine(audioSession: audioSession)
        } catch let error {
            print("Engine Creation Error: \(error)")
        }
        
        guard let engine = engine else {
            print("Failed to create engine!")
            return
        }
        
        // The stopped handler alerts you of engine stoppage due to external causes.
        engine.stoppedHandler = { reason in
            print("The engine stopped for reason: \(reason.rawValue)")
            switch reason {
            case .audioSessionInterrupt:
                print("Audio session interrupt")
            case .applicationSuspended:
                print("Application suspended")
            case .idleTimeout:
                print("Idle timeout")
            case .systemError:
                print("System error")
            case .notifyWhenFinished:
                print("Playback finished")
            case .gameControllerDisconnect:
                print("Controller disconnected.")
            case .engineDestroyed:
                print("Engine destroyed.")
            @unknown default:
                print("Unknown error")
            }
        }
 
        // The reset handler provides an opportunity for your app to restart the engine in case of failure.
        engine.resetHandler = {
            // Try restarting the engine.
            print("The engine reset --> Restarting now!")
            do {
                try self.engine?.start()
            } catch {
                print("Failed to restart the engine: \(error)")
            }
        }
    }
    
    func playHapticsPattern(type: HapticPattern) {
        
        // If the device doesn't support Core Haptics, abort.
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        // Express the path to the AHAP file before attempting to load it.
        guard let path = Bundle.main.path(forResource: type.text, ofType: "ahap") else {
            return
        }
        
        do {
            // Start the engine in case it's idle.
            try engine?.start()
            
            // Tell the engine to play a pattern.
            try engine?.playPattern(from: URL(fileURLWithPath: path))
            
        } catch { // Engine startup errors
            print("An error occured playing \(type.text): \(error).")
        }
    }
    
    func cancelHaptics() {
        engine?.stop()
    }
}
