// main.swift

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow?
    var vc: NSViewController?

    func applicationDidFinishLaunching(_ notification: Notification) {
        window = NSWindow(contentRect: NSMakeRect(10, 10, 400, 300), styleMask: [.titled, .closable, .miniaturizable], backing: .buffered, defer: false)
        let content = window!.contentView! as NSView
        vc = ViewController()
        content.addSubview(vc!.view)
        window!.makeKeyAndOrderFront(nil)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        print("Sayonara :)")
        return true
    }

}

let app = NSApplication.shared
app.setActivationPolicy(.regular)
app.delegate = AppDelegate()
app.run()
