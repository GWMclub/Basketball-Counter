import SwiftUI

struct ContentView: View {
    @State private var count1 = 0
    @State private var count2 = 0
    @State private var showingResetConfirmation = false

    var body: some View {
        VStack {
            Text("\(count1) : \(count2)")
                .font(.title)
                .bold()
            Spacer()
            HStack {
                VStack {
                    Button(action: {
                        count1 += 2
                    }) {
                        Text("+2")
                    }
                    Button(action: {
                        count1 += 3
                    }) {
                        Text("+3")
                    }
                }
                VStack {
                    Button(action: {
                        count2 += 2
                    }) {
                        Text("+2")
                    }
                    Button(action: {
                        count2 += 3
                    }) {
                        Text("+3")
                    }
                }
            }
            Button(action: {
                showingResetConfirmation = true
            }) {
                Text("Reset")
            }
            .alert(isPresented: $showingResetConfirmation) {
                Alert(
                    title: Text("Reset Counters"),
                    message: Text("Are you sure you want to reset both counters?"),
                    primaryButton: .destructive(Text("Reset"), action: { resetCounters() }),
                    secondaryButton: .cancel()
                )
            }
        }
    }
    
    func resetCounters() {
        count1 = 0
        count2 = 0
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
