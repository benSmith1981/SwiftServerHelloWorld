import Kitura
import HeliumLogger
import Foundation
import MongoKitten

// Create a new router
let router = Router()

// Initialize HeliumLogger
HeliumLogger.use()

// Resolve the port that we want the server to listen on.
let port: Int
let defaultPort = 8080
if let requestedPort = ProcessInfo.processInfo.environment["PORT"] {
    port = Int(requestedPort) ?? defaultPort
} else {
    port = defaultPort
}
let mongoDB: Database?
do {
    mongoDB = try Database("mongodb://bensmith:1a2b3c4d@ds121945.mlab.com:21945/heroku_xvlwvnkd")
    // Add your application here
    print("Connected to MongoDB")
    router.get("/getAllItems/") {
        request, response, next in
        if let mongoDB = mongoDB {
            let items = mongoDB["ShoppingItems"]
            for document in try items.find() {
                // do something with document
                print(document)
                response.send("\(document)")

            }

        }
    }

} catch {
    print("Cannot connect to MongoDB")
}

// Handle HTTP GET requests to /
router.get("/hello/:name") {
    request, response, next in
    let name = request.parameters["name"] ?? "World!"
    response.send("Hello \(name)")

//    response.send(json: {"name":{"items":{"Price":0,"name":"Party"}}})
}


// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: port, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
