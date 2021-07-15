//
//  AudioRecorder.swift
//  Toggle Testing
//
//  Created by Panupatr Limprasert on 15/7/2564 BE.
//
import SwiftUI
import Combine//for PassthroughObject
import AVFoundation

class AudioRecorder: ObservableObject {
    
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    var audioRecorder: AVAudioRecorder!
    
    var recording = false {
        didSet {//anytime recording is changed, send self to objectWillChange's subscribers
            objectWillChange.send(self)
        }
    }
    
    func startRecording() {
        //create a recording session
        let recordingSession = AVAudioSession.sharedInstance()
        
        do {//define type for our recording
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session.")
        }
        
        //specify location and filename
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("SavedVoiceFile.m4a")
        //specify settings
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.record()
            
            recording = true
        } catch {
            print("Could not start recording")
        }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        recording = false
    }
}
