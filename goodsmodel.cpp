#include "goodsmodel.h"

GoodsModel::GoodsModel(QObject *parent) : QObject(parent)
{
    n_manager = new QNetworkAccessManager(this);
}

bool GoodsModel::loadGoods(const QUrl& url)
{
    QNetworkRequest request(url);
    QNetworkReply* reply=  n_manager->get(request);

    QEventLoop loop;
    connect(reply, SIGNAL(finished()), &loop, SLOT(quit()));
    loop.exec();

    if (reply->error() == QNetworkReply::NoError)
    {
        goods = reply->readAll();
        return true;
    }

    else
    {
        qDebug() << "Error = " << reply->errorString();
        return false;
    }
    reply->deleteLater();
}

QVariant GoodsModel::getModel()

{
    QJsonDocument goods_doc=QJsonDocument::fromJson(goods);
    return goods_doc.toVariant();
}
