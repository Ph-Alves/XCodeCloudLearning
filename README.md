# XCodeCloudLearning

Projeto base criado com apoio do Claude Code, com foco em montar manualmente um pipeline de CI/CD com o **Xcode Cloud** — usando um app simples de To-Do como pretexto para ter algo real para buildar, testar e distribuir.

## Sobre

O app em si é intencionalmente simples: uma lista de tarefas em SwiftUI com `@Observable`, servindo como alvo de build/test para o pipeline. O foco de aprendizado está na configuração do Xcode Cloud (workflows, triggers de build por branch/PR, execução de testes automatizados) e não na complexidade do app.

## Funcionalidades do app

- Adicionar tarefa (`TodoController.add(title:)`, com validação de título vazio)
- Marcar/desmarcar como concluída (`toggle(item:)`)
- Editar título de uma tarefa existente (`update(item:newTitle:)`)
- Remover por índice ou por item (`delete(at:)` / `deleteItem(_:)`)

## Estrutura

```
LearningXCodeCloud/
├── TodoItem.swift          # Model (Identifiable, Equatable, Sendable)
├── TodoController.swift    # @Observable — CRUD da lista de tarefas
└── ContentView.swift
LearningXCodeCloudTests/
LearningXCodeCloudUITests/
```

## Tecnologias

- Swift, SwiftUI (`@Observable`)
- Xcode Cloud (CI/CD)
- XCTest (testes unitários e de UI já inclusos no projeto)

## Requisitos

- Xcode
- Conta Apple Developer conectada ao Xcode Cloud, caso queira reproduzir os workflows de CI/CD (não necessário só para rodar o app localmente)

## Como rodar

1. Clone o repositório
2. Abra `LearningXCodeCloud.xcodeproj` no Xcode
3. Rode localmente (`Cmd + R`) ou explore os workflows de Xcode Cloud em **Product > Xcode Cloud** para reproduzir o pipeline
