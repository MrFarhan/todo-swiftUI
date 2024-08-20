import SwiftUI

struct ContentView: View {
    @State private var todo: String = ""
    
    struct TodoType: Identifiable {
        let id = UUID()
        var text: String
        var isDone: DarwinBoolean?
    }

    @State private var todoList: [TodoType] = []  // Empty initial state
    
      
    var body: some View {
        VStack {
            Text("My Todo App")
                .font(.headline)
                .foregroundColor(Color.green)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack {
                TextField("Add your todo", text: $todo).padding()
                Button("Add") {
                    if !todo.isEmpty {
                        todoList.append(TodoType(text: todo))
                        todo = ""
                    }
                }
            }
            .padding()
            
            List {
                ForEach(todoList) { ac in
                    VStack{
                        Text(ac.text)
                        Text("Hello")
                        Button("Delete") {
                          if let index = todoList.firstIndex(where: { $0.id == ac.id }) {
                           todoList.remove(at: index)
                                    }
                               }
                            .foregroundColor(.red)
                    }
                    
                }.onDelete(perform: deleteItems)
            }

        }
    }
    func deleteItems(at offsets: IndexSet) {
        todoList.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
