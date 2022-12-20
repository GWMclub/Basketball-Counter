import SwiftUI

enum PointsButton {
    case plusOne
    case plusTwo
    case plusThree
    
    var description: String {
        switch self {
            case .plusOne: return "+1"
            case .plusTwo: return "+2"
            case .plusThree: return "+3"
        }
    }
}

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
                    makeButton(.plusOne, action: { counters.count1 += 1 })
                    makeButton(.plusTwo, action: { counters.count1 += 2 })
                    makeButton(.plusThree, action: { counters.count1 += 3 })
                }
                VStack {
                    makeButton(.plusOne, action: { counters.count2 += 1 })
                    makeButton(.plusTwo, action: { counters.count2 += 2 })
                    makeButton(.plusThree, action: { counters.count2 += 3 })
                }
            }
        }
    }
    
    private func makeButton(_ pointsButton: PointsButton, action: @escaping () -> ()) -> some View {
        Group {
            Button(action: {
                action()
            }) {
                Text(pointsButton.description)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Counters())
    }
}
