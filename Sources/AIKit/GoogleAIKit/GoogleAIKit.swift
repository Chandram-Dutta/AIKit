import Foundation

class GoogleAIKit: AIKit {
    private let apiKey: String
    private let baseURL = "https://generativelanguage.googleapis.com/v1beta/models/"

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    private struct Response: Codable {
        let candidates: [Candidate]
    }

    private struct Candidate: Codable {
        let content: Content
    }

    private struct Content: Codable {
        let parts: [Part]
    }

    private struct Part: Codable {
        let text: String
    }

    func generateText(model: String, message: String) async throws -> String {
        guard let url = URL(string: "\(baseURL)\(model):generateContent?key=\(apiKey)") else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = [
            "contents": [
                [
                    "role": "user",
                    "parts": [
                        [
                            "text": message
                        ]
                    ],
                ]
            ]
        ]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(Response.self, from: data)
        return response.candidates.first!.content.parts.first!.text
    }

    func model(_ name: String) -> Model {
        return Model(kit: self, name: name)
    }
}

func createGoogleGenerativeAI(apiKey: String) -> GoogleAIKit {
    return GoogleAIKit(apiKey: apiKey)
}
