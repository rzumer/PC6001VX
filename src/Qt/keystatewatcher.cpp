#include "keystatewatcher.h"

#include <QTimer>
#include "../keyboard.h"

KeyStateWatcher::KeyStateWatcher(KEY6 *key, QObject *parent)
	: QObject(parent)
	, Key(key)
	, ON_SHIFT(false)
	, ON_GRAPH(false)
	, ON_KANA(false)
	, ON_KKANA(false)
	, ON_CAPS(false)
{
	auto timer = new QTimer(this);
	timer->setInterval(100);
	connect(timer, SIGNAL(timeout()), this, SLOT(poll()));
	timer->start();
}

void KeyStateWatcher::poll()
{
	bool changed = false;
	if(Key->ON_SHIFT != this->ON_SHIFT)	changed = true;
	this->ON_SHIFT = Key->ON_SHIFT;

	if(Key->ON_GRAPH != this->ON_GRAPH)	changed = true;
	this->ON_GRAPH = Key->ON_GRAPH;

	if(Key->ON_KANA != this->ON_KANA)	changed = true;
	this->ON_KANA = Key->ON_KANA;

	if(Key->ON_KKANA != this->ON_KKANA)	changed = true;
	this->ON_KKANA = Key->ON_KKANA;

	if(Key->ON_CAPS != this->ON_CAPS)	changed = true;
	this->ON_CAPS = Key->ON_CAPS;

	if (changed){
		emit stateChanged(
					ON_SHIFT,
					ON_GRAPH,
					ON_KANA,
					ON_KKANA,
					ON_CAPS);
	}
}
