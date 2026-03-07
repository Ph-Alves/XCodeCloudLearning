import Foundation

@Observable
class TodoController {
    private(set) var items: [TodoItem] = []

    func add(title: String) {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        items.append(TodoItem(title: title))
    }

    func toggle(item: TodoItem) {
        guard let index = items.firstIndex(of: item) else { return }
        items[index].isDone.toggle()
    }

    func update(item: TodoItem, newTitle: String) {
        guard let index = items.firstIndex(of: item),
              !newTitle.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        items[index].title = newTitle
    }

    func delete(at index: Int) {
        guard items.indices.contains(index) else { return }
        items.remove(at: index)
    }

    func deleteItem(_ item: TodoItem) {
        items.removeAll { $0.id == item.id }
    }
}
