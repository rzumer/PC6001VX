#ifndef CONFIGDIALOG_H
#define CONFIGDIALOG_H

#include <QDialog>

class cConfig;

namespace Ui {
    class ConfigDialog;
}

class ConfigDialog : public QDialog
{
    Q_OBJECT

public:
    explicit ConfigDialog(cConfig* cfg, QWidget *parent = 0);
    ~ConfigDialog();

private:
    Ui::ConfigDialog *ui;
    cConfig* config;

private slots:
    void assignColorButton();
    void readConfig();
    void writeConfig();
};

#endif // CONFIGDIALOG_H