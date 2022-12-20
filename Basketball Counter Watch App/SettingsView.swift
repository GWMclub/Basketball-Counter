import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var counters: Counters
    
    @State private var isShownResetCountersAlert = false
    @State private var isShownResetTimerAlert = false

    @State private var isStartsTimer = false
    @State private var timeRemaining = 900
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text(getTime(from: timeRemaining))
                .font(.title)
                .bold()
            .onReceive(timer) { _ in
                if timeRemaining > 0 && isStartsTimer {
                    timeRemaining -= 1
                }
            }
            Button(action: {
                isStartsTimer.toggle()
            }) {
                isStartsTimer ? Text("Pause timer") : Text("Start timer")
            }
            Button(action: {
                isShownResetTimerAlert = true
            }) {
                Text("Reset timer")
            }
            .alert(isPresented: $isShownResetTimerAlert) {
                Alert(
                    title: Text("Reset Timer"),
                    message: Text("Are you sure you want to reset timer?"),
                    primaryButton: .destructive(Text("Reset"), action: { resetTimer() }),
                    secondaryButton: .cancel()
                )
            }
            Button(action: {
                isShownResetCountersAlert = true
            }) {
                Text("Reset counters")
            }
            .alert(isPresented: $isShownResetCountersAlert) {
                Alert(
                    title: Text("Reset Counters"),
                    message: Text("Are you sure you want to reset both counters?"),
                    primaryButton: .destructive(Text("Reset"), action: { counters.resetCounters() }),
                    secondaryButton: .cancel()
                )
            }
        }
    }
    
    private func resetTimer() {
        isStartsTimer = false
        timeRemaining = 900
    }
    
    private func getTime(from seconds: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(seconds)) ?? "00:00"
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Counters())
    }
}
