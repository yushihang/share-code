import Foundation

// 定义待匹配的字符串
let input = "-[xxx yyyyy]"

// 定义正则表达式模式，提取括号内的内容
let pattern = "\\[\\s*(\\w+)\\s+(\\w+)\\s*\\]"

// 创建正则表达式对象
guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
    fatalError("Invalid regular expression pattern")
}

// 进行匹配
let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))

// 提取匹配到的内容
if let match = matches.first, match.numberOfRanges == 3 {
    let range1 = match.range(at: 1)
    let range2 = match.range(at: 2)
    
    if let substring1 = Range(range1, in: input), let substring2 = Range(range2, in: input) {
        let result1 = String(input[substring1])
        let result2 = String(input[substring2])
        
        print("Matched substring1: \(result1)") // 输出 xxx
        print("Matched substring2: \(result2)") // 输出 yyyyy
    }
}
