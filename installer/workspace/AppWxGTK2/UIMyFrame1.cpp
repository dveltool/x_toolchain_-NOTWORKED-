#include "UIMyFrame1.h"

UIMyFrame1::UIMyFrame1(wxWindow* parent) :
		MyFrame1(parent) {

	wxString str = wxString::Format("Welcome to %s, running on %s",
	wxVERSION_STRING, wxGetOsDescription());
	m_staticText3->SetLabel(str);

	m_statusBar1->SetStatusText("This is status bar");

	m_staticText4->SetLabel(
			"wxWidgets is very easy to learn, it's C++ and fully OOP");

	m_staticText5->SetLabel(wxGetOsDescription());

}

void UIMyFrame1::m_button1OnButtonClick(wxCommandEvent& event) {

	wxString name = wxString::Format("Hello %s!! How are you?",
			m_textCtrl1->GetValue());
	wxMessageBox(name);

}
