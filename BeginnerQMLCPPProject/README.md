# Qt Quick TCP Chat Client
<img width="408" height="630" alt="beginnerapp" src="https://github.com/user-attachments/assets/489c5c88-987d-48d7-970a-e191c91d8a77" />

## 🚀 Features
- Full-Stack Architecture: Separation of concerns using C++ for logic and QML for UI.
- Real-Time Networking: Asynchronous TCP/IP communication using QTcpSocket.
- Dynamic UI: WhatsApp-style message bubbles that adapt color and alignment based on the sender.
- Model-View-Delegate: Efficient rendering of chat history using ListView and ListModel.
- Status Monitoring: Real-time connection status updates (Connected/Disconnected) via Qt Signals & Slots.

## 🛠️ Tech Stack
- Framework: Qt 6.x
- Language: C++17 (Backend), QML (Frontend)
- Build System: CMake
- Networking: TCP/IP Sockets

##🏗️ Architecture
- The project follows the Modern Qt 6 integration pattern:
- TcpClient (C++): A QObject subclass registered as a QML_ELEMENT. It handles socket connections, error handling, and data transmission.
- Main.qml (QML): The declarative UI that instantiates the backend. It uses Q_PROPERTY bindings to react to connection state changes automatically.

## ⚙️ How to Run
# 1. Start the Server (The "Listener")
Since this is a client application, you need a TCP server to talk to. You can use netcat to simulate a server instantly.

**On Linux / macOS**: Open a terminal and run:

Bash
```bash
# Listen on port 1234
nc -l -p 1234
```
**On Windows**: Use a tool like Packet Sender or run ncat:

PowerShell
```bash
ncat -l -p 1234
```

# 2. Run the Application
1. Open the project in Qt Creator.
2. Configure the project (Desktop Kit).
3. Click Run (Green Play Button).
4. In the app, click "Connect".
5. Type a message and hit Enter!

## 🧠 Concepts Demonstrated
- C++/QML Integration: Using Q_INVOKABLE, Signals, and Slots to bridge two languages.
- Property Bindings: Leveraging QML's reactive engine to update UI state without manual DOM manipulation.
- Asynchronous I/O: Handling network data without freezing the main UI thread.
- Component Styling: creating reusable, responsive delegates for the ListView.

## 🔮 Future Improvements
[ ] Implementation of a dedicated C++ Server application.

[ ] Support for JSON-based message packets.

[ ] Compilation for Android/Mobile.
