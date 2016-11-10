import Commander
import Cocoa

Group {
    $0.command("u", description: "Json url") { (url: String) in
        guard let URL = URL(string: url) else {
            print("Please provide a valid url ..")
            exit(1)
        }
        URLHandler.fetchJson(at: URL, completion: { json in
            print("json \(json)")
        })
    }
    
    $0.command("f", description: "Json file path") { (path: String) in
        print("file path: \(path)")
    }
}.run()
