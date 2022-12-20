import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var counters: Counters
    @State private var showingResetConfirmation = false

    var body: some View {
        VStack {
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
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
