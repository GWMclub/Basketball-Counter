import SwiftUI

struct MainView: View {
    @EnvironmentObject private var counters: Counters

    var body: some View {
        VStack {
            Text("\(counters.count1) : \(counters.count2)")
                .font(.title)
                .bold()
            Spacer()
            HStack {
                VStack {
                    Button(action: {
                        counters.count1 += 2
                    }) {
                        Text("+2")
                    }
                    Button(action: {
                        counters.count1 += 3
                    }) {
                        Text("+3")
                    }
                }
                VStack {
                    Button(action: {
                        counters.count2 += 2
                    }) {
                        Text("+2")
                    }
                    Button(action: {
                        counters.count2 += 3
                    }) {
                        Text("+3")
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
