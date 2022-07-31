import SwiftUI

struct PomodoroTimer: View {
    @State var timeRemaining = 10
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("\(timeRemaining)")
                .onReceive(timer) { _ in
                    if timeRemaining > 0 && timerRunning {
                        timeRemaining -= 1
                    } else {
                        timerRunning = false
                    }
                }
            Button {
                timerRunning = true
            } label: {
                Text("Start")
            }
        }
    }
}

struct PomodoroTimer_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroTimer()
    }
}
