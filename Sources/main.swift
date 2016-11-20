import Commander
import Cocoa

Group {
    $0.command("u", description: "Json url") { (url: String) in
        URLHandler.fetchJson(at: url)
    }
    
    $0.command("f", description: "Json file path") { (path: String) in
        FileHandler.fetchJsonFile(from: path)
    }
}.run()
