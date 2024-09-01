//
//  ContentView.swift
//  CustomHaptics-SampleProject
//
//  Created by Diki Dwi Diro on 31/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 50){
                
                natureHapticsButton
                
                footstepsHapticsButton
                
                musicHapticsButton
            }
            .navigationTitle("Custom Haptics")
        }
    }
    
    var natureHapticsButton: some View {
        VStack(alignment: .leading) {
            Label("Nature", systemImage: "leaf.fill")
                .font(.system(.title2, weight: .semibold))
            
            HStack(spacing: 100) {
                Button {
                    CoreHapticsManager.shared.playHapticsPattern(type: .rain)
                } label: {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("Rain")
                                .font(.system(.body, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                }
                                
                Button {
                    CoreHapticsManager.shared.playHapticsPattern(type: .water)
                } label: {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("Water")
                                .font(.system(.body, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                }
            }
        }
    }
    
    var footstepsHapticsButton: some View {
        VStack(alignment: .leading) {
            Label("Footsteps", systemImage: "shoeprints.fill")
                .font(.system(.title2, weight: .semibold))
            
            HStack(spacing: 100) {
                Button {
                    CoreHapticsManager.shared.playHapticsPattern(type: .dirt)
                } label: {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("Dirt")
                                .font(.system(.body, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                }
                                
                Button {
                    CoreHapticsManager.shared.playHapticsPattern(type: .grass)
                } label: {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("Grass")
                                .font(.system(.body, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                }
            }
        }
    }
    
    var musicHapticsButton: some View {
        VStack(alignment: .leading) {
            Label("Music", systemImage: "music.note")
                .font(.system(.title2, weight: .semibold))
            
            HStack(spacing: 100) {
                Button {
                    CoreHapticsManager.shared.playHapticsPattern(type: .accousticGuitar)
                } label: {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("Accoustic Guitar")
                                .font(.system(.body, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                }
                                
                Button {
                    CoreHapticsManager.shared.playHapticsPattern(type: .banjo)
                } label: {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("Banjo")
                                .font(.system(.body, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                }
            }
        }

    }
}

#Preview {
    ContentView()
}
