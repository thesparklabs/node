public protocol NodeConvertibleFloatingPointType: NodeConvertible {
    var doubleValue: Double { get }
    init(_ other: Double)
}

extension Float: NodeConvertibleFloatingPointType {
    public var doubleValue: Double {
        return Double(self)
    }
}

extension Double: NodeConvertibleFloatingPointType {
    public var doubleValue: Double {
        return Double(self)
    }
}

extension NodeConvertibleFloatingPointType {
    public init(node: Node) throws {
        guard let double = node.double else {
            throw Error.unableToConvert(input: node, expectation: "\(Self.self)", path: [])
        }
        self.init(double)
    }

    public func makeNode(in context: Context? = nil) -> Node {
        return Node(.number(StructuredData.Number(doubleValue)))
    }
}