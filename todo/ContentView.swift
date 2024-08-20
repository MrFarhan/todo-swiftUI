import SwiftUI

struct ContentView: View {
    var activities = ["Archery","Baseball"]

    @State var selected = "Baseball"
    
    var body: some View {
 
        
        VStack{
            Text("My Swift App")
                .font(.headline)
                .foregroundColor(Color.green)
                .multilineTextAlignment(.center)
                .padding(0.0)
            
              
            
            Circle()
                .fill(.blue)
                .padding()
                .overlay(
                    Image(systemName:"figure.\(selected.lowercased())").font(
                        .system(size:144)
                    ).foregroundColor(.white)
                )
            Text("\(selected)123").font(.system(size:30))

        }
        

        
        Button("Next") {
            
            withAnimation(.easeInOut(duration: 1)) {
                selected = activities.randomElement() ?? "Archery"
            }
            
        }.buttonStyle(.borderedProminent)
    }
}

#Preview {
    ContentView()
}
