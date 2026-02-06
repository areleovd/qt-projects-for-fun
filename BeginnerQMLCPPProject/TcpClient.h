#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QtQml/qqmlregistration.h> // Required for QML_ELEMENT

class TcpClient : public QObject {
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString status READ status NOTIFY statusChanged)

public:
    explicit TcpClient(QObject *parent = nullptr); // Declaration only

    Q_INVOKABLE void connectToServer(const QString &ip, int port);
    Q_INVOKABLE void sendMessage(const QString &message);

    QString status() const { return m_status; }

signals:
    void statusChanged();
    void messageReceived(QString msg);

private:
    QTcpSocket socket;
    QString m_status = "Disconnected";
};

#endif // TCPCLIENT_H
