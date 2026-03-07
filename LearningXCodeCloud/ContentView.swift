//
//  ContentView.swift
//  LearningXCodeCloud
//
//  Created by Paulo Henrique Costa Alves on 07/03/26.
//

import SwiftUI

struct ContentView: View {
    @State private var controller = TodoController()
    @State private var newTitle = ""

    var body: some View {
        NavigationStack {
            List {
                HStack {
                    TextField("Nova tarefa", text: $newTitle)
                        .onSubmit { addItem() }
                    Button("Adicionar") { addItem() }
                        .disabled(newTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }

                ForEach(controller.items) { item in
                    HStack {
                        Button { controller.toggle(item: item) } label: {
                            Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                        }
                        Text(item.title)
                            .strikethrough(item.isDone)
                    }
                }
                .onDelete { offsets in
                    offsets.sorted(by: >).forEach { controller.delete(at: $0) }
                }
            }
            .navigationTitle("To-Do List")
        }
    }

    private func addItem() {
        controller.add(title: newTitle)
        newTitle = ""
    }
}

#Preview {
    ContentView()
}
