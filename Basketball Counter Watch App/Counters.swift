import SwiftUI
import Foundation

class Counters: ObservableObject {
    @Published var count1 = 0
    @Published var count2 = 0
    
    func resetCounters() {
        count1 = 0
        count2 = 0
    }
}
