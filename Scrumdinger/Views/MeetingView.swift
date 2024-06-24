//
//  MeetingView.swift
//  Created by Luca Selvaggio on 20/06/24.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    
    @Binding var scrum: DailyScrum
    
    // @StateObject to create a source of truth for reference type models that conform to the ObservableObject protocol.
    @StateObject var scrumTimer = ScrumTimer()
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    // The initializer requests access to the speech recognizer and microphone the first time that the system calls the object.
    @StateObject var speechRecognizer = SpeechRecognizer()
    
    // Property to toggle the recording state in the view’s life cycle.
    @State private var isRecording = false
    
    var body: some View {
        
        ZStack {        // To maintain visual consistency with the list view, you’ll fill the shape with the scrum’s color.
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(
                    secondsElapsed: scrumTimer.secondsElapsed,
                    secondsRemaining: scrumTimer.secondsRemaining,
                    theme: scrum.theme
                )
                MeetingTimerView(speakers: scrumTimer.speakers, theme: scrum.theme, isRecording: isRecording)
                
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
                
            }
            .padding()
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        
        //  life cycle methods to trigger events when a view appears and disappears
        .onAppear {
            startScrum()
        }
        .onDisappear {
            endScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func startScrum() {
        
        // The timer resets each time an instance of MeetingView shows on screen, indicating that a meeting should begin.
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
        
        // Start transcribing using the speech recognizer when the meeting begins.
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
        isRecording = true
        
        scrumTimer.startScrum()
    }
    
    private func endScrum() {
        scrumTimer.stopScrum()
        
        // Stop transcribing the meeting.
        speechRecognizer.stopTranscribing()
        isRecording = false
        
        let newHistory = History(attendees: scrum.attendees,
                                         transcript: speechRecognizer.transcript)
        scrum.history.insert(newHistory, at: 0)
    }
}



#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
