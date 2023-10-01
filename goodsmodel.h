#ifndef GOODSMODEL_H
#define GOODSMODEL_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QTextCodec>
#include <QEventLoop>
#include <QJsonDocument>
#include <QCoreApplication>
#include <QUrl>


class GoodsModel : public QObject
{
    Q_OBJECT
public:
    explicit GoodsModel(QObject *parent = nullptr);

    Q_INVOKABLE bool loadGoods(const QUrl& url);
    Q_INVOKABLE QVariant getModel();

private:
    QNetworkAccessManager* n_manager;
    QByteArray goods;
};

#endif // GOODSMODEL_H
