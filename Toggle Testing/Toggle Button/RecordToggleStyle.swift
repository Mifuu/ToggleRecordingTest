//
//  RecordToggleStyle.swift
//  Toggle Testing
//
//  Created by Panupatr Limprasert on 15/7/2564 BE.
//
import SwiftUI

struct RecordToggleStyle: ToggleStyle {
    @ObservedObject var audioRecorder: AudioRecorder
    
    func makeBody(configuration: Self.Configuration) -> some View {
        Image(systemName: configuration.isOn ? "mic.circle.fill" : "mic.circle")
            .resizable()
            .frame(width: 50, height: 50)
            .foregroundColor(configuration.isOn ? .blue : .gray)
            .onTapGesture {
                configuration.isOn.toggle()
                if configuration.isOn {
                    audioRecorder.startRecording()
                } else {
                    audioRecorder.stopRecording()
                }
            }
    }
}
