
<!--- single purchase --->
<cfif #URL.option# EQ "1">
<!--- get record --->
<cfquery name="get_record" datasource="FiscalPurchase">
SELECT *
FROM singlePurchase
WHERE recordID=#URL.recordID#
</cfquery>

<! DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
            "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML>

<HEAD>
	<TITLE>Fiscal - Food & Beverage Single Purchase</TITLE>	
	<META NAME="Creator"  content="Department of Veterans Affairs, Veterans Health Administration, Deputy Under Secretary for Operations and Management, Veterans Integrated Network Office 8, Bay Pines VA Healthcare System, Fiscal">
	<META NAME="Description" CONTENT="This application provides accounting of Food & Beverage Single Purchase requests.">
	<META NAME="Keywords" CONTENT="Food, Beverage, Single, Purchase">
	<META NAME="Subject" CONTENT="Food & Beverage Single Purchase">
	<META NAME="DateCreated" CONTENT="20090715">
	<META NAME="DateReviewed" CONTENT="20090715">	
	<META NAME="Language" CONTENT="en">
	<META NAME="Type" CONTENT="Interactive Resource">
   	<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
</HEAD>

<BODY>
<!--- Heading table --->
<TABLE WIDTH="650" border="0" ALIGN="center">
<TR>
<TD colspan="2" align="left" VALIGN="top"><SPAN style="color:#000080; font-size:24px; font-family:'Times New Roman', Times, serif">Department of<BR />Veterans Affairs</SPAN></TD>
<TD ALIGN="right" VALIGN="top"><SPAN style="color:#000080; font-size:30px; font-family:'Times New Roman', Times, serif"><STRONG>Memorandum</STRONG></SPAN></TD>
</TR>
<TR><TD COLSPAN="3">&nbsp;</TD></TR>
<TR><TD COLSPAN="3">
<CFOUTPUT query="get_record">
<TABLE width="100%" border="0">
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Date:</TD>
<TD COLSPAN="2">#DateFormat(rDate , "mmmm dd, yyyy")#</TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">From:</TD>
<TD COLSPAN="2">#title#, #service#</TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Subj:</TD>
<TD COLSPAN="2">Approval Request: Food & Beverage - Single Purchase (Number: <STRONG>#recordID#</STRONG>)</TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">To:</TD>
<TD COLSPAN="2"><cfoutput>#SESSION.director#</cfoutput>, Assistant Director, Bay Pines VA Healthcare System</TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Through:</TD>
<TD COLSPAN="2"><cfoutput>#SESSION.fiscal#</cfoutput>, Chief, Fiscal Service</TD>
</TR>
<TR>
<TD COLSPAN="3">&nbsp;</TD>
</TR>
<TR>
<TD COLSPAN="3">
<TABLE WIDTH="100%" border="0" ALIGN="center">
<TR>
<TD>FCP/GPF <SUP>1</SUP></TD>
<TD>#fcpgpf#</TD>
<TD COLSPAN="2"> Est Amount of Purchase: $ #DecimalFormat(amount)#</TD>
</TR>
<TR>
<TD COLSPAN="4"><SUP>1</SUP> If GPF: Will the purchase meet intent of the donated funds? #GPF#
</TD>
</TR>
<TR>
<TD COLSPAN="4">
<P align="justify">I am requesting formal approval to allow for the purchase of food and/or beverages utilizing a Government Purchase Card (GPC) for payment. Based on my review of the exceptions to the general rule, as it applies to using appropriated funds to procure food and beverages, the use of these funds is justified as it meets the following exception(s).</P>
</TD>
</TR> 												
<TR>
<TD colspan="4">
	<CFIF #option1# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Agency Hosting a Formal Conference<BR />
	<CFELSE>
	</CFIF>

  	<CFIF #option2# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Award Ceremonies under the Government Incentives Awards Act<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option3# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Bottled Water<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option4# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Canteen Promotional Fund<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option5# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Cultural Events<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option6# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Focus Groups<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option7# EQ "Yes">
	&nbsp;&nbsp;&nbsp;General Post Funds<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option8# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Guest Speakers<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option9# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Medical Research<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option10# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Medical Treatment<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option11# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Perishing Hall Revolving Fund<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option12# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Routine Agency Meeting Held at Outside Facility Where There Is an All Inclusive Rental Fee<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option13# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Secretary’s Reception and Representation Expenses<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option14# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Training Under the Government Employees Training Act<BR />
	<CFELSE>
	</CFIF>
	
	<CFIF #option15# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Volunteers: Tour Extends Over Meal Period<BR />
	<CFELSE>
	</CFIF>

	<CFIF #option16# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Working at Official Duty Station under Extreme Conditions<BR />
	<CFELSE>
	</CFIF>
	</TD>				
</TR>
<TR>
<TD COLSPAN="4"><EM>Written description demonstrating justification for using station funds for this purchase:</EM></TD>
</TR>
<TR>
<TD>Purpose:</TD>
<TD COLSPAN="3">#fbPurpose#</TD>
</TR>
<TR>
<TD>Type of Food/Bev:</TD>
<TD COLSPAN="3">#fbType#</TD>
</TR>
<TR>
<TD COLSPAN="4">If <STRONG>ACTIVITY</STRONG>, indicate the following:</TD>
</TR>
<TR>
<TD> Activity/Event:</TD>
<TD COLSPAN="3">#activity#</TD>
</TR>
<TR>
<TD valign="top"> Date:</TD>
<TD COLSPAN="3">#DateFormat(EDate , "mm/dd/yyyy")#
</TD>
</TR>
<TR>
<TD> Location:</TD>
<TD COLSPAN="3">#location#</TD>
</TR>
<TR>
<TD> Attendees:</TD>
<TD COLSPAN="3">#attendees#</TD>
</TR>
<TR>
<TD> Number of Attendees:</TD>
<TD COLSPAN="3">#attendees2#</TD>
</TR>
<TR>
<TD>Whom is the activity for:</TD>
<TD valign="top"><CFIF #parties# EQ "Select >>">N/A<CFELSE>#parties#</CFIF></TD>
<TD COLSPAN="2" VALIGN="top"><CFIF #parties# EQ "Other">OTHER: #partiesOther#</CFIF></TD>
</TR>
<TR>
<TD>Type of request:</TD>
<TD><CFIF #type# EQ "Select >>">N/A<CFELSE>#type#</CFIF></TD>
<TD COLSPAN="2" VALIGN="top"><CFIF #type# EQ "Other">OTHER: #typeOther#</CFIF></TD>
</TR>
<TR>
<TD COLSPAN="4">
Additonal comment(s) supporting this request :<BR>
#issue#
</TD>
</TR>
<TR>
<TD COLSPAN="2"> If approved, order will be placed on a GPC by:</TD>
<TD COLSPAN="2">
#clerk#
</TD>
</TR>
<TR>
<TD COLSPAN="4" valign="top">#rName#<BR>
Requester</TD>
</TR>
<CFIF #aTrigger# EQ "1">
<TR>
<TD colspan="2"><STRONG>Approving Official Approved</STRONG></TD>
<TD colspan="2">Date: #DateFormat(aDate , "mm/dd/yyyy")#</TD>
</TR>
<TR>
<TD COLSPAN="4">Comment: #aComment#</TD>
</TR>
<CFELSEIF #aTrigger# EQ "2">
<TR>
<TD COLSPAN="2"><STRONG>Approving Official Dispproved</STRONG></TD>
<TD COLSPAN="2">Date: #DateFormat(aDate , "mm/dd/yyyy")#</TD>
</TD>
</TR>
<TR>
<TD COLSPAN="4">Comment: #aComment#</TD>
</TR>
<CFELSE>
<TR><TD COLSPAN="4"><STRONG>Awaiting Approving Officer's Review</STRONG></TD></TR>
</CFIF>
<CFIF #fTrigger# EQ "1">
<TR>
<TD COLSPAN="2"><STRONG>Fiscal Officer Approved</STRONG></TD>
<TD COLSPAN="2">Date: #DateFormat(fDate , "mm/dd/yyyy")#</TD>
</TD>
</TR>
<TR>
<TD COLSPAN="4">Comment: #fComment#</TD>
</TR>
<CFELSEIF #fTrigger# EQ "2">
<TR>
<TD COLSPAN="2"><STRONG>Fiscal Officer Dispproved</STRONG></TD>
<TD COLSPAN="2">Date: #DateFormat(fDate , "mm/dd/yyyy")#</TD>
</TD>
</TR>
<TR>
<TD COLSPAN="4">Comment: #fComment#</TD>
</TR>
<CFELSE>
<TR><TD COLSPAN="4"><STRONG>Awaiting Fiscal Officer's Review</STRONG></TD></TR>
</CFIF>
<CFIF #dTrigger# EQ "1">
<TR>
<TD COLSPAN="2"><STRONG>Director Approved</STRONG></TD>
<TD COLSPAN="2">Date: #DateFormat(dDate , "mm/dd/yyyy")#</TD>
</TR>
<TR>
<TD COLSPAN="4">Comment: #dComment#</TD>
</TR>
<CFELSEIF #dTrigger# EQ "2">
<TR>
<TD COLSPAN="2"><STRONG>Director Dispproved</STRONG></TD>
<TD COLSPAN="2">Date: #DateFormat(dDate , "mm/dd/yyyy")#</TD>
</TD>
</TR>
<TR>
<TD COLSPAN="4">Comment: #dComment#</TD>
</TR>
<CFELSE>
<TR><TD COLSPAN="4"><STRONG>Awaiting Director's Review</STRONG></TD></TR>
</CFIF>
</TABLE>
</CFOUTPUT>
</cfif>


<!--- blanket purchase --->
<cfif #URL.option# EQ "2">
<!--- get record --->
<cfquery name="get_record" datasource="FiscalPurchase">
SELECT *
FROM blanketPurchase
WHERE recordID=#URL.recordID#
</cfquery>


<! DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
            "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML>

<HEAD>
	<TITLE>Fiscal - Food & Beverage Blanket Purchase</TITLE>	
	<META NAME="Creator"  content="Department of Veterans Affairs, Veterans Health Administration, Deputy Under Secretary for Operations and Management, Veterans Integrated Network Office 8, Bay Pines VA Healthcare System, Fiscal">
	<META NAME="Description" CONTENT="This application provides accounting of Food & Beverage Blanket Purchase requests.">
	<META NAME="Keywords" CONTENT="Food, Beverage, Blanket, Purchase">
	<META NAME="Subject" CONTENT="Food & Beverage Blanket Purchase">
	<META NAME="DateCreated" CONTENT="20090715">
	<META NAME="DateReviewed" CONTENT="20131205">	
	<META NAME="Language" CONTENT="en">
	<META NAME="Type" CONTENT="Interactive Resource">
   	<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
</HEAD>

<BODY>
<!--- Heading table --->
<TABLE WIDTH="650" border="0" ALIGN="center">
<TR>
<TD colspan="2" align="left" VALIGN="top"><SPAN style="color:#000080; font-size:24px; font-family:'Times New Roman', Times, serif">Department of<BR />Veterans Affairs</SPAN></TD>
<TD ALIGN="right" VALIGN="top"><SPAN style="color:#000080; font-size:30px; font-family:'Times New Roman', Times, serif"><STRONG>Memorandum</STRONG></SPAN></TD>
</TR>
<TR><TD COLSPAN="3">&nbsp;</TD></TR>
<TR><TD COLSPAN="3">
<CFOUTPUT query="get_record">
<TABLE width="100%" border="0">
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Date:</TD>
<TD COLSPAN="2">#DateFormat(rDate , "mmmm dd, yyyy")#</TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">From:</TD>
<TD COLSPAN="2">#title#, #service#</TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Subj:</TD>
<TD COLSPAN="2">Approval Request: Food & Beverage - Blanket Purchase (Number: <STRONG>#recordID#</STRONG>)</TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">To:</TD>
<TD COLSPAN="2"><cfoutput>#SESSION.director#</cfoutput>, Assistant Director, Bay Pines VA Healthcare System</TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Through:</TD>
<TD COLSPAN="2"><cfoutput>#SESSION.fiscal#</cfoutput>, Chief, Fiscal Service</TD>
</TR>
<TR>
<TD COLSPAN="3">&nbsp;</TD>
</TR>
<TR>
<TD COLSPAN="3">

<TABLE WIDTH="100%" border="0" ALIGN="center">
<TR>
<TD>FCP/GPF <SUP>1</SUP></TD>
<TD>#fcpgpf#</TD>
<TD COLSPAN="2"> Est Amount of Purchase: $ #DecimalFormat(amount)#</TD>
</TR>
<TR>
<TD COLSPAN="4"><SUP>1</SUP> If GPF: Will the purchase meet intent of the donated funds? #GPF#<BR>
GPF Donation ID ##: #gpfID#
</TD>
</TR>
<TR>
<TD COLSPAN="4">
<P align="justify">I am requesting formal blanket approval for the purchase of food and/or beverages utilizing a Government Purchase Card (GPC) for payment. This purchase qualifies for a blanket approval since it falls under the category of medical treatment. This request qualifies for a 6 month Blanket Approval based on meeting the following requirement(s):</P>
</TD>
</TR> 												
<TR>
<TD colspan="4">
<CFIF #option1# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Nutrition Service for Inpatient Meals<BR />
<CFELSE>
</CFIF>

<CFIF #option2# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Medical Therapy involving food preparation (Living Skills Program)<BR />
<CFELSE>
</CFIF>

<CFIF #option3# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Refreshments for the Blood Donor Program<BR />
<CFELSE>
</CFIF>

<CFIF #option4# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Patients in Hospice Program <BR />
<CFELSE>
</CFIF>

<CFIF #option5# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Homeless Program<BR />
<CFELSE>
</CFIF>

<CFIF #option6# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Mental Health Integrated Supportive Action Programs (Day Treatment Centers, etc)<BR />
<CFELSE>
</CFIF>

<CFIF #option7# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Readjustment Programs (for patients particiapting in psychiatry treatment plans)<BR />
<CFELSE>
</CFIF>

<CFIF #option8# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Medical Treatment<BR />
<CFELSE>
</CFIF>

<CFIF #option9# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Medical Research<BR />
<CFELSE>
</CFIF>

<CFIF #option10# EQ "Yes">
	&nbsp;&nbsp;&nbsp;General Post Funds<BR />
<CFELSE>
</CFIF>
	</TD>				
</TR>
<TR>
<TD COLSPAN="4"><EM>Written description demonstrating justification for using station funds for this purchase:</EM></TD>
</TR>
<TR>
<TD>Purpose:</TD>
<TD COLSPAN="3">#fbPurpose#</TD>
</TR>
<TR>
<TD>Type of Food/Bev:</TD>
<TD COLSPAN="3">#fbType#
</TD>
</TR>
<TR>
<TD COLSPAN="4">If <STRONG>ACTIVITY</STRONG>, indicate the following:</TD>
</TR>
<TR>
<TD>Activity/Event:</TD>
<TD COLSPAN="3">#activity#</TD>
</TR>
<TR>
<TD valign="top">Date:</TD>
<TD>
From: #DateFormat(BDate , "mm/dd/yyyy")#
</TD>
<TD COLSPAN="2">
To:	#DateFormat(EDate , "mm/dd/yyyy")#
</TD>
</TR>
<TR>
<TD>Location:</TD>
<TD COLSPAN="3">#location#</TD>
</TR>
<TR>
<TD>Attendees:</TD>
<TD COLSPAN="3">#attendees#</TD>
</TR>
<TR>
<TD>Number of Attendees:</TD>
<TD COLSPAN="3">#attendees2#</TD>
</TR>
<TR>
<TD COLSPAN="4">
Additonal comment(s) supporting this request:<BR>
#issue#
</TD>
</TR>
<TR>
<TD COLSPAN="2"> If approved, order will be placed on a GPC by:</TD>
<TD COLSPAN="2">
#clerk#
</TD>
</TR>
<TR>
<TD COLSPAN="4" valign="top">#rName#<BR>
Requester</TD>
</TR>
<CFIF #aTrigger# EQ "1">
<TR>
<TD colspan="2"><STRONG>Approving Official Approved</STRONG></TD>
<TD colspan="2">Date: #DateFormat(aDate , "mm/dd/yyyy")#</TD>
</TR>
<TR>
<TD COLSPAN="4">Comment: #aComment#</TD>
</TR>
<CFELSEIF #aTrigger# EQ "2">
<TR>
<TD COLSPAN="2"><STRONG>Approving Official Dispproved</STRONG></TD>
<TD COLSPAN="2">Date: #DateFormat(aDate , "mm/dd/yyyy")#</TD>
</TD>
</TR>
<TR>
<TD COLSPAN="4">Comment: #aComment#</TD>
</TR>
<CFELSE>
<TR><TD COLSPAN="4"><STRONG>Awaiting Approving Officer's Review</STRONG></TD></TR>
</CFIF>
<CFIF #fTrigger# EQ "1">
<TR>
<TD COLSPAN="2"><STRONG>Fiscal Officer Approved</STRONG></TD>
<TD COLSPAN="2">Date: #DateFormat(fDate , "mm/dd/yyyy")#</TD>
</TD>
</TR>
<TR>
<TD COLSPAN="4">Comment: #fComment#</TD>
</TR>
<CFELSEIF #fTrigger# EQ "2">
<TR>
<TD COLSPAN="2"><STRONG>Fiscal Officer Dispproved</STRONG></TD>
<TD COLSPAN="2">Date: #DateFormat(fDate , "mm/dd/yyyy")#</TD>
</TD>
</TR>
<TR>
<TD COLSPAN="4">Comment: #fComment#</TD>
</TR>
<CFELSE>
<TR><TD COLSPAN="4"><STRONG>Awaiting Fiscal Officer's Review</STRONG></TD></TR>
</CFIF>
<CFIF #dTrigger# EQ "1">
<TR>
<TD COLSPAN="2"><STRONG>Director Approved</STRONG></TD>
<TD COLSPAN="2">Date: #DateFormat(dDate , "mm/dd/yyyy")#</TD>
</TR>
<TR>
<TD COLSPAN="4">Comment: #dComment#</TD>
</TR>
<CFELSEIF #dTrigger# EQ "2">
<TR>
<TD COLSPAN="2"><STRONG>Director Dispproved</STRONG></TD>
<TD COLSPAN="2">Date: #DateFormat(dDate , "mm/dd/yyyy")#</TD>
</TD>
</TR>
<TR>
<TD COLSPAN="4">Comment: #dComment#</TD>
</TR>
<CFELSE>
<TR><TD COLSPAN="4"><STRONG>Awaiting Director's Review</STRONG></TD></TR>
</CFIF>
</TABLE>
</CFOUTPUT>
</cfif>

<BR />

<SPAN style="color:#CCCCCC; font-size:12px">Automated VA FORM 2105</SPAN>
</TD>
<CFIF #URL.huh# EQ "1">
<!--- show nothing --->
<CFELSE>
<TR>
<TD COLSPAN="3">
	<DIV ALIGN="right">
	<A href="reportProcessed.cfm" CLASS="mini" TITLE="BACK">BACK</A></DIV>

<!--- Date Last Modified --->
<P>Application Reviewed/ Updated: July 15, 2009</P>
</TD>
</TR>
</CFIF>
</TABLE>
</TD>
</TR>
</TABLE>
</BODY>
</HTML>
