//
//  ToggleTestingView.swift
//  Toggle Testing
//
//  Created by Panupatr Limprasert on 15/7/2564 BE.
// learning source: https://www.appcoda.com/swiftui-toggle-style/
// :https://blckbirds.com/post/voice-recorder-app-in-swiftui-1/


import SwiftUI

struct ToggleTestingView: View {
    @ObservedObject var audioRecorder: AudioRecorder
    //@State var isOn = false
    
    var body: some View {
        Toggle("Recording", isOn: $audioRecorder.recording)
            .toggleStyle(RecordToggleStyle(audioRecorder: audioRecorder))
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleTestingView(audioRecorder: AudioRecorder())
    }
}
