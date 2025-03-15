import Foundation

protocol AIKit {
    func generateText(model: String, message: String) async throws -> String
}

func generateText(model: Model, message: String) async throws -> String {
    let text = try await model.kit.generateText(model: model.name, message: message)
    return text
}
