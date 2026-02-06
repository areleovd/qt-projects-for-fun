#include "TcpClient.h"

TcpClient::TcpClient(QObject *parent) : QObject(parent)
{
    // 1. Handle Connection State
    connect(&socket, &QTcpSocket::connected, this, [this]() {
        m_status = "Connected!";
        emit statusChanged();
    });

    connect(&socket, &QTcpSocket::disconnected, this, [this]() {
        m_status = "Disconnected";
        emit statusChanged();
    });

    // 2. Handle Errors (e.g., Connection Refused)
    connect(&socket, &QTcpSocket::errorOccurred, this, [this](QAbstractSocket::SocketError error) {
        Q_UNUSED(error); // We just want the string description
        m_status = "Error: " + socket.errorString();
        emit statusChanged();
    });

    // 3. Handle Incoming Data
    connect(&socket, &QTcpSocket::readyRead, this, [this]() {
        // Read everything the server sent
        QByteArray data = socket.readAll();
        // Emit the signal so QML can grab the text
        emit messageReceived(QString::fromUtf8(data));
    });
}

void TcpClient::connectToServer(const QString &ip, int port)
{
    // Always good to abort previous connections before starting a new one
    socket.abort();

    m_status = "Connecting...";
    emit statusChanged();

    socket.connectToHost(ip, port);
}

void TcpClient::sendMessage(const QString &message)
{
    if (socket.state() == QAbstractSocket::ConnectedState) {
        // Convert QString to UTF-8 bytes and write to socket
        socket.write(message.toUtf8());
    }
}
