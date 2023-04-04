import SwiftUI
import PlaygroundSupport
import Combine

class UserData: ObservableObject {
    var name = "Abdul"
}
struct ContentView4: View {
    @State private var isRotated = false

    var body: some View {
        Image(systemName: "arrow.up")
            .rotationEffect(Angle(degrees: isRotated ? 180 : 0))
            .animation(Animation.easeInOut(duration: 1.0)
                        .repeatForever(autoreverses: true))
    }
}
struct ContentView2: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<10) { index in
                    Text("Item \(index)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 100)
                        .background(Color.blue)
                }
            }
        }
    }
}
struct ContentView3: View {
    var body: some View {
        TabView {
            Text("First tab")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
            Text("Second tab")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
        }
    }
}
struct DetailView: View {
    @Binding var data:UserData
    var body: some View {
        Text(data.name)
    }
}

struct ContentView: View {
    @State private var value:Int = 0
    @State private var str = ""
    @EnvironmentObject var data: UserData
    @State var myData: UserData
    var body: some View {
        VStack {
            Text("\(value)")
            Spacer()
            Text("\(data.name)")
            Spacer(minLength: 20)
            ChildView(str: $str)
            Spacer()
            ContentView4()
            Spacer()
            NavigationLink(" Go to Detail", destination: DetailView(data: $myData))
        }
    }
}

struct ChildView: View {
    @Binding var str: String
    var body: some View {
        TextField("Enter Your name",text:$str)
    }
}

let data = UserData()
let contentView = ContentView(myData: data).environmentObject(data)

PlaygroundPage.current.setLiveView(contentView)
