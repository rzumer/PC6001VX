#ifndef COLORBUTTON_H
#define COLORBUTTON_H

#include <QPushButton>

class cConfig;

// 色選択用のボタン
class ColorButton : public QPushButton
{
    Q_OBJECT
public:
    explicit ColorButton(QWidget *parent = 0);

signals:

public slots:
public:
    void initialize(int id, cConfig* cfg);
    // ボタンサイズは30x20を基準とする
    virtual QSize sizeHint () const {return QSize (30, 20);}

private:
    void setColor(QColor color);
    int colorId;
    cConfig* config;
};

#endif // COLORBUTTON_H