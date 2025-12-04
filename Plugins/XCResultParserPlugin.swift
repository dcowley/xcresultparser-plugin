import Foundation
import PackagePlugin

@main
struct XCResultParserPlugin: CommandPlugin {
    func performCommand(
        context: PluginContext,
        arguments: [String]
    ) async throws {
        let xcresultparser = try context.tool(named: "xcresultparser")
        let process = try Process.run(xcresultparser.url, arguments: arguments)
        process.waitUntilExit()
    }
}
