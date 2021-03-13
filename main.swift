// main.swift

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        window = NSWindow(contentRect: NSMakeRect(10, 10, 400, 300), styleMask: [.titled, .resizable, .closable], backing: .buffered, defer: false)
        let content = window!.contentView! as NSView
        let vc = ViewController()
        content.addSubview(vc.view)
        window!.makeKeyAndOrderFront(nil)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        print("Sayonara :)")
        return true
    }

}

class ViewController: NSViewController {
    override func loadView() {
    }
}

let app = NSApplication.shared
app.setActivationPolicy(.regular)
app.delegate = AppDelegate()
app.run()
