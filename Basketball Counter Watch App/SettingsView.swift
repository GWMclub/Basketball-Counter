import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var counters: Counters
    @State private var showingResetConfirmation = false
    @State private var startingTimer = false

    @State var timeRemaining = 900
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text(getTime(from: timeRemaining))
                .font(.title)
                .bold()
            .onReceive(timer) { _ in
                if timeRemaining > 0 && startingTimer {
                    timeRemaining -= 1
                }
            }
            Button(action: {
                startingTimer.toggle()
            }) {
                startingTimer ? Text("Pause timer") : Text("Start timer")
            }
            Button(action: {
                timeRemaining = 900
            }) {
                Text("Reset timer")
            }
            
            Button(action: {
                showingResetConfirmation = true
            }) {
                Text("Reset counters")
            }
            .alert(isPresented: $showingResetConfirmation) {
                Alert(
                    title: Text("Reset Counters"),
                    message: Text("Are you sure you want to reset both counters?"),
                    primaryButton: .destructive(Text("Reset"), action: { counters.resetCounters() }),
                    secondaryButton: .cancel()
                )
            }
        }
    }
    
    func getTime(from seconds: Int) -> String {
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
