///////////////////////////////////////////////////////////////////////////
// C++ code generated with wxFormBuilder (version Jan 16 2016)
// http://www.wxformbuilder.org/
//
// PLEASE DO "NOT" EDIT THIS FILE!
///////////////////////////////////////////////////////////////////////////

#include "UI.h"

///////////////////////////////////////////////////////////////////////////

MyFrame1::MyFrame1( wxWindow* parent, wxWindowID id, const wxString& title, const wxPoint& pos, const wxSize& size, long style ) : wxFrame( parent, id, title, pos, size, style )
{
	this->SetSizeHints( wxDefaultSize, wxDefaultSize );
	
	wxBoxSizer* bSizer1;
	bSizer1 = new wxBoxSizer( wxVERTICAL );
	
	m_staticText1 = new wxStaticText( this, wxID_ANY, wxT("Hello World!"), wxDefaultPosition, wxDefaultSize, 0 );
	m_staticText1->Wrap( -1 );
	m_staticText1->SetFont( wxFont( 15, 74, 90, 90, false, wxT("Sans") ) );
	
	bSizer1->Add( m_staticText1, 0, wxALL|wxALIGN_CENTER_HORIZONTAL, 5 );
	
	m_staticText3 = new wxStaticText( this, wxID_ANY, wxT("MyLabel"), wxDefaultPosition, wxDefaultSize, 0 );
	m_staticText3->Wrap( -1 );
	bSizer1->Add( m_staticText3, 0, wxALL|wxALIGN_CENTER_HORIZONTAL, 5 );
	
	m_staticline1 = new wxStaticLine( this, wxID_ANY, wxDefaultPosition, wxDefaultSize, wxLI_HORIZONTAL );
	bSizer1->Add( m_staticline1, 0, wxEXPAND | wxALL, 5 );
	
	m_staticText4 = new wxStaticText( this, wxID_ANY, wxT("MyLabel"), wxDefaultPosition, wxDefaultSize, 0 );
	m_staticText4->Wrap( -1 );
	m_staticText4->SetFont( wxFont( 10, 74, 90, 92, false, wxT("Sans") ) );
	
	bSizer1->Add( m_staticText4, 0, wxALL|wxALIGN_CENTER_HORIZONTAL, 5 );
	
	m_staticline2 = new wxStaticLine( this, wxID_ANY, wxDefaultPosition, wxDefaultSize, wxLI_HORIZONTAL );
	bSizer1->Add( m_staticline2, 0, wxEXPAND | wxALL, 5 );
	
	wxFlexGridSizer* fgSizer1;
	fgSizer1 = new wxFlexGridSizer( 0, 2, 0, 0 );
	fgSizer1->AddGrowableCol( 1 );
	fgSizer1->SetFlexibleDirection( wxBOTH );
	fgSizer1->SetNonFlexibleGrowMode( wxFLEX_GROWMODE_SPECIFIED );
	
	m_staticText2 = new wxStaticText( this, wxID_ANY, wxT("Type your name here:"), wxDefaultPosition, wxDefaultSize, 0 );
	m_staticText2->Wrap( -1 );
	fgSizer1->Add( m_staticText2, 0, wxALL|wxALIGN_CENTER_VERTICAL, 5 );
	
	m_textCtrl1 = new wxTextCtrl( this, wxID_ANY, wxT("My name is ....."), wxDefaultPosition, wxDefaultSize, 0 );
	fgSizer1->Add( m_textCtrl1, 0, wxALL|wxEXPAND, 5 );
	
	
	fgSizer1->Add( 0, 0, 1, wxEXPAND, 5 );
	
	m_button1 = new wxButton( this, wxID_ANY, wxT("Click me"), wxDefaultPosition, wxDefaultSize, 0 );
	fgSizer1->Add( m_button1, 0, wxALL, 5 );
	
	
	bSizer1->Add( fgSizer1, 0, wxEXPAND, 5 );
	
	m_staticline3 = new wxStaticLine( this, wxID_ANY, wxDefaultPosition, wxDefaultSize, wxLI_HORIZONTAL );
	bSizer1->Add( m_staticline3, 0, wxEXPAND | wxALL, 5 );
	
	m_staticText5 = new wxStaticText( this, wxID_ANY, wxT("MyLabel"), wxDefaultPosition, wxDefaultSize, 0 );
	m_staticText5->Wrap( -1 );
	m_staticText5->SetFont( wxFont( 16, 74, 90, 90, false, wxT("Sans") ) );
	
	bSizer1->Add( m_staticText5, 0, wxALL|wxALIGN_CENTER_HORIZONTAL, 5 );
	
	
	this->SetSizer( bSizer1 );
	this->Layout();
	m_statusBar1 = this->CreateStatusBar( 1, wxST_SIZEGRIP, wxID_ANY );
	
	this->Centre( wxBOTH );
	
	// Connect Events
	m_button1->Connect( wxEVT_COMMAND_BUTTON_CLICKED, wxCommandEventHandler( MyFrame1::m_button1OnButtonClick ), NULL, this );
}

MyFrame1::~MyFrame1()
{
	// Disconnect Events
	m_button1->Disconnect( wxEVT_COMMAND_BUTTON_CLICKED, wxCommandEventHandler( MyFrame1::m_button1OnButtonClick ), NULL, this );
	
}
