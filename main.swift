// main.swift

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        window = NSWindow(contentRect: NSMakeRect(10, 10, 400, 300), styleMask: [.titled, .closable, .miniaturizable], backing: .buffered, defer: false)
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
        self.view = NSView(frame: NSMakeRect(0, 0, 400, 300))
    }
    
    override func viewDidLoad() {
        setupUI()
        inputField.delegate = self
    }
    
    func setupUI() {
        labelify(titleLabel)
        titleLabel.stringValue = "Welcome to the Mustang Bronco Program!"
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        labelify(displayLabel)
        displayLabel.stringValue = "Mustang Bronco"
        displayLabel.font = .systemFont(ofSize: 40)
        
        let stack = NSStackView()
        stack.alignment = .centerX
        stack.spacing = 70
        stack.addArrangedSubview(inputField)
        stack.addArrangedSubview(displayLabel)

        [titleLabel, stack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    
    func labelify(_ label: NSTextField) {
        label.isBezeled = false
        label.drawsBackground = false
        label.isEditable = false
        label.isSelectable = false
    }

    func controlTextDidChange(_ obj: Notification) {
        print("meow")
        guard let intValue = Int(inputField.stringValue) else { return }
        let divs3 = intValue % 3 == 0
        let divs5 = intValue % 5 == 0
        
        if divs3 && divs5 {
            displayLabel.stringValue = "MustangBronco"
        } else if divs3 {
            displayLabel.stringValue = "Mustang"
        } else if divs5 {
            displayLabel.stringValue = "Bronco"
        } else {
            displayLabel.stringValue = inputField.stringValue
        }
    }
    
}

let app = NSApplication.shared
app.setActivationPolicy(.regular)
app.delegate = AppDelegate()
app.run()
