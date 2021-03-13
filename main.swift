// main.swift

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        window = NSWindow(contentRect: NSMakeRect(10, 10, 400, 300), styleMask: [.titled, .closable], backing: .buffered, defer: false)
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

class ViewController: NSViewController, NSTextFieldDelegate {
    
    let titleLabel = NSTextField()
    let inputField = NSTextField()
    let displayLabel = NSTextField()
    
    override func loadView() {
        setupUI()
        inputField.delegate = self
    }
    
    func setupUI() {
        self.view = NSView(frame: NSMakeRect(0, 0, 400, 300))
        
        labelify(titleLabel)
        titleLabel.stringValue = "Welcome to the Mustang Bronco Program!"
        
        labelify(displayLabel)

        [titleLabel, inputField, displayLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            inputField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            inputField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            inputField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    func labelify(_ label: NSTextField) {
        label.isBezeled = false
        label.drawsBackground = false
        label.isEditable = false
        label.isSelectable = false
    }

    func controlTextDidChange(_ obj: Notification) {
        displayLabel.stringValue = inputField.stringValue
    }
    
}

let app = NSApplication.shared
app.setActivationPolicy(.regular)
app.delegate = AppDelegate()
app.run()
