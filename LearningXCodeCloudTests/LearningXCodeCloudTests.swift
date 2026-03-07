//
//  LearningXCodeCloudTests.swift
//  LearningXCodeCloudTests
//
//  Created by Paulo Henrique Costa Alves on 07/03/26.
//

import Foundation
import Testing
@testable import LearningXCodeCloud

struct TodoControllerTests {
    @Test func addItem() {
        let controller = TodoController()
        controller.add(title: "Comprar pão")
        #expect(controller.items.count == 1)
        #expect(controller.items.first?.title == "Comprar pão")
        #expect(controller.items.first?.isDone == false)
    }

    @Test func addEmptyTitleIsIgnored() {
        let controller = TodoController()
        controller.add(title: "   ")
        #expect(controller.items.isEmpty)
    }

    @Test func toggleItem() {
        let controller = TodoController()
        controller.add(title: "Tarefa")
        let item = controller.items[0]
        controller.toggle(item: item)
        #expect(controller.items[0].isDone == true)
        controller.toggle(item: controller.items[0])
        #expect(controller.items[0].isDone == false)
    }

    @Test func updateItem() {
        let controller = TodoController()
        controller.add(title: "Antigo")
        let item = controller.items[0]
        controller.update(item: item, newTitle: "Novo")
        #expect(controller.items[0].title == "Novo")
    }

    @Test func updateWithEmptyTitleIsIgnored() {
        let controller = TodoController()
        controller.add(title: "Original")
        let item = controller.items[0]
        controller.update(item: item, newTitle: "  ")
        #expect(controller.items[0].title == "Original")
    }

    @Test func deleteAtIndex() {
        let controller = TodoController()
        controller.add(title: "A")
        controller.add(title: "B")
        controller.add(title: "C")
        controller.delete(at: 1)
        #expect(controller.items.count == 2)
        #expect(controller.items.map(\.title) == ["A", "C"])
    }

    @Test func deleteItem() {
        let controller = TodoController()
        controller.add(title: "X")
        controller.add(title: "Y")
        let item = controller.items[0]
        controller.deleteItem(item)
        #expect(controller.items.count == 1)
        #expect(controller.items[0].title == "Y")
    }

    @Test func todoItemEquality() {
        let id = UUID()
        let a = TodoItem(id: id, title: "Test")
        let b = TodoItem(id: id, title: "Test")
        #expect(a == b)
    }
}
