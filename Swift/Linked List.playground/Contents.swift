// Creating Linked List Node

public class Node<nodeType> {
    public var value: nodeType
    public var next: Node?
    
    public init(value: nodeType) {
        self.value = value
    }
    
}

// Creating String output Extension
extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

// Single Linked List

public class SinglyLinkedList<listType> {
    
    public var head: Node<listType>?
    public var tail: Node<listType>?
    
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    
    public func append(value: listType) {
        let newNode = Node(value: value)
        if var h = head {
            while h.next != nil {
                h = h.next!
            }
            h.next = newNode
        } else {
            head = newNode
        }
    }
    
    
    func insert(value: listType, index: Int) {
        let newNode = Node(value: value)
        
        if (index == 0) {
            newNode.next = head
            head = newNode
        } else {
            var prev = head
            var cur = head
            
            for _ in 0..<index {
                prev = cur
                cur = cur?.next
            }
            newNode.next = prev?.next
            prev?.next = newNode
        }
    }
    
    
    public func removeLast() -> listType? {
        if let h = head {
            if h.next == nil {
                defer {
                    head = nil
                    tail = nil
                }
                return h.value
            }
            
            var prev = h
            var curr = h
            
            while let next = curr.next {
                prev = curr
                curr = next
            }
            
            prev.next = nil
            tail = prev
            
            return curr.value
        
        } else {
            return nil
        }
    }
    
}

extension SinglyLinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

// Creating and appenind linked list

var newList = SinglyLinkedList<Int>()

newList.append(value: 2)
newList.append(value: 4)
newList.append(value: 6)
newList.append(value: 8)

print(newList)

// Inserting a value into linked list

print("newList: \(newList)")

newList.insert(value: 1, index: 0)
print("1 has been added to index 0: \(newList)")

newList.insert(value: 3, index: 2)
print("3 has been added to index 2: \(newList)")

newList.insert(value: 5, index: 4)
print("5 has been added to index 4: \(newList)")


