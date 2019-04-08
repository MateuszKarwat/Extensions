// MARK: - Identifier

struct Identifier<T>: RawRepresentable, Hashable {
    static func == (lhs: Identifier<T>, rhs: Identifier<T>) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }

    let rawValue: String

    init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Identifier: ExpressibleByStringLiteral {
    typealias StringLiteralType = String

    init(stringLiteral: String) {
        self.init(rawValue: stringLiteral)
    }
}

extension Identifier: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(String.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}

// MARK: - Identifiable

protocol Identifiable: Hashable {
    var identifier: Identifier<Self> { get }
}

extension Identifiable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier.hashValue)
    }
}
