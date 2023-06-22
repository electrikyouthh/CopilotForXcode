import Client
import SuggestionModel
import Foundation
import XcodeKit

class PromptToCodeCommand: NSObject, XCSourceEditorCommand, CommandType {
    var name: String { "Prompt to Code" }

    func perform(
        with invocation: XCSourceEditorCommandInvocation,
        completionHandler: @escaping (Error?) -> Void
    ) {
        completionHandler(nil)
        if #available(macOSApplicationExtension 12.0, *) {
            Task {
                let service = try getService()
                _ = try await service.promptToCode(editorContent: .init(invocation))
            }
        } else {
    }
}
