import Kitura
import HeliumLogger
import Foundation
//import Alamofire

// Create a new router
let router = Router()

// Initialize HeliumLogger
HeliumLogger.use()

// Handle HTTP GET requests to /
router.get("/hello/:name") {
    request, response, next in
    let name = request.parameters["name"] ?? "World!"
    response.send(name)
//    response.send(json: {"name":{"items":{"Price":0,"name":"Party"}}})
}

// Resolve the port that we want the server to listen on.
let port: Int
let defaultPort = 8080
if let requestedPort = ProcessInfo.processInfo.environment["PORT"] {
    port = Int(requestedPort) ?? defaultPort
} else {
    port = defaultPort
}

do {
    let mongoDB = try Database(mongoURL: "mongodb://heroku_xvlwvnkd:<dbpassword>@ds121945.mlab.com:21945/heroku_xvlwvnkd")
    let users = mongoDB["users"]
    // Add your application here
    print("Connecte to MongoDB")

} catch {
    print("Cannot connect to MongoDB")
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: port, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
