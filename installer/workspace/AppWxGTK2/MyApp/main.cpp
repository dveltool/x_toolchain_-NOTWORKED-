/***************************************************************
 * Purpose:   Code for Application with GTK2
 * Name:      main.cpp
 * Author:    Dedy Yasriady (yasriady@yahoo.com)
 * Created:   2014-04-20
 * Copyright: Dedy Yasriady (http://yasriady.blogspot.com)
 * License:
 **************************************************************/

#include <wx/wx.h>
#include "../UIMyFrame1.h"

class MyApp: public wxApp {

public:
	MyApp() {
	}
	virtual ~MyApp() {
	}
	virtual bool OnInit();
	virtual int OnExit() {
		return 0;
	}

};

IMPLEMENT_APP (MyApp);

inline bool MyApp::OnInit() {
	//Initialize main Frame
	wxFrame* mainFrame = new UIMyFrame1(NULL);
	mainFrame->Show(true);
	SetTopWindow(mainFrame);

	return true;
}

