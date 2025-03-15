import Foundation
import Testing

@testable import AIKit

@Test func GoogleAIKitGenerateText() async throws {
    let googleAIKit = createGoogleGenerativeAI(
        apiKey: ProcessInfo.processInfo.environment["GOOGLE_API_KEY"]!)
    let model = googleAIKit.model("gemini-2.0-flash-lite")
    let text = try await generateText(model: model, message: "Hello, world!")
    print("response: \(text)")
    #expect(Bool(true))
}
