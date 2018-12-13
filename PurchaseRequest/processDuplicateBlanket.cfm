<!--- check for changes --->
<CFIF #FORM.change1# EQ "1">
	<cfset FORM.bDate=FORM.bDateA>
	<cfset FORM.eDate=FORM.eDateA>
</CFIF>
<CFIF #FORM.change2# EQ "1">
	<cfset FORM.clerk=FORM.clerkA>
</CFIF>	
<CFIF #FORM.change3# EQ "1">
	<cfset FORM.service=FORM.serviceA>
</CFIF>	

<!--- write to database --->
	
<cfquery name="post_data" datasource="FiscalPurchase">
INSERT INTO blanketpurchase (rDate, fcpgpf, amount, GPF,  
		<CFIF IsDefined("FORM.gpfID")>
 	gpfID,
	</CFIF>
		<CFIF IsDefined("FORM.option1")>
 	option1,
	</CFIF>
		<CFIF IsDefined("FORM.option2")>
 	option2,
	</CFIF>
		<CFIF IsDefined("FORM.option3")>
 	option3,
	</CFIF>
		<CFIF IsDefined("FORM.option4")>
 	option4,
	</CFIF>
		<CFIF IsDefined("FORM.option5")>
 	option5,
	</CFIF>
		<CFIF IsDefined("FORM.option6")>
 	option6,
	</CFIF>
		<CFIF IsDefined("FORM.option7")>
 	option7,
	</CFIF>
		<CFIF IsDefined("FORM.option8")>
 	option8,
	</CFIF>
		<CFIF IsDefined("FORM.option9")>
 	option9,
	</CFIF>
		<CFIF IsDefined("FORM.option10")>
 	option10,
	</CFIF>			  
fbpurpose, fbtype, activity, location, attendees, attendees2, bDate, eDate, issue, clerk, rname, rEmail, title, aEmail, service, rUser, aTrigger, fTrigger, dTrigger)
VALUES ('#FORM.rDate#', 
		#FORM.fcpgpf#, 
		#FORM.amount#, 
		'#FORM.GPF#',
		 <CFIF IsDefined("FORM.gpfID")> 
		'#FORM.gpfID#',
		</CFIF> 
		<CFIF IsDefined("FORM.option1")>
 	'#FORM.option1#',
	</CFIF>
		<CFIF IsDefined("FORM.option2")>
 	'#FORM.option2#',
	</CFIF>
		<CFIF IsDefined("FORM.option3")>
 	'#FORM.option3#',
	</CFIF>
		<CFIF IsDefined("FORM.option4")>
 	'#FORM.option4#',
	</CFIF>
		<CFIF IsDefined("FORM.option5")>
 	'#FORM.option5#',
	</CFIF>
		<CFIF IsDefined("FORM.option6")>
 	'#FORM.option6#',
	</CFIF>
		<CFIF IsDefined("FORM.option7")>
 	'#FORM.option7#',
	</CFIF>
		<CFIF IsDefined("FORM.option8")>
 	'#FORM.option8#',
	</CFIF>
		<CFIF IsDefined("FORM.option9")>
 	'#FORM.option9#',
	</CFIF>
		<CFIF IsDefined("FORM.option10")>
 	'#FORM.option10#',
	</CFIF>			 
		'#FORM.fbpurpose#', 
		'#FORM.fbtype#', 
		'#FORM.activity#', 
		'#FORM.location#',
		'#FORM.attendees#',
		#FORM.attendees2#,  
		###FORM.bDate###, 
		###FORM.eDate###, 
		'#FORM.issue#', 
		'#FORM.clerk#', 
		'#FORM.rname#', 
		'#FORM.rEmail#', 
		'#FORM.title#', 
		'#FORM.aEmail#', 
		'#FORM.service#',
		'#SESSION.lUser#',
		0,
		0,
		0)
</cfquery>
 
<cfquery name="get_recordID" datasource="FiscalPurchase">
SELECT TOP 1 recordID, aEmail
FROM BlanketPurchase
ORDER BY recordID DESC
</cfquery>

<!--- send email to approving official --->
<cfmail to="#aEmail#" from="eASLDoNotReply@va.gov" subject="F&B Blanket Purchase Request Submitted" type="html" query="get_recordID">
<p>Please approve / reject the recently submitted Blanket Purchase Request.</p>
<p>Issue:  <A HREF="https://vaww.eslse.cf.va.gov/BAY/Fiscal/PurchaseRequest/aReviewBlanket.cfm?recordID=#recordID#">#FORM.fbpurpose#</a></p>
</cfmail>


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
	<META NAME="DateReviewed" CONTENT="20090715">	
	<META NAME="Language" CONTENT="en">
	<META NAME="Type" CONTENT="Interactive Resource">
   	<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
</HEAD>

<BODY>
<!--- Heading table --->
<TABLE WIDTH="650" border="0" ALIGN="center">
<TR>
<TD colspan="2" align="left" VALIGN="top"><span style="color:#000080; font-size:24px; font-family:'Times New Roman', Times, serif">Department of<br />Veterans Affairs</span></TD>
<TD ALIGN="right" VALIGN="top"><span style="color:#000080; font-size:30px; font-family:'Times New Roman', Times, serif"><STRONG>Memorandum</STRONG></span></TD>
</TR>
<TR><TD COLSPAN="3">&nbsp;</TD></TR>
<TR><TD COLSPAN="3">
<TABLE width="100%" border="0">
<TR><CFOUTPUT>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Date:</TD>
<TD COLSPAN="2">#DateFormat(FORM.rDate , "mmmm dd, yyyy")#</TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">From:</TD>
<TD COLSPAN="2"><em>to be completed by the Approving Official</em></TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Subj:</TD>
<TD COLSPAN="2">Approval Request: Food & Beverage - Blanket Purchase (Number: <strong>#get_RecordID.recordID#</strong>)</TD>
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
<TH COLSPAN="3" style="font-variant:small-caps">&nbsp;</TH>
</TR>
<TR>
<TD COLSPAN="3">
<TABLE WIDTH="100%" border="0" ALIGN="center">
<TR>
<TD> FCP/GPF <sup>1</sup></TD>
<TD><strong>#FORM.fcpgpf#</strong></TD>
<TD COLSPAN="2"> Est Amount of Purchase: $ <strong>#FORM.amount#</strong></TD>
</TR>
<TR>
<TD COLSPAN="4"><sup>1</sup> If GPF: Will the purchase meet intent of the donated funds? 
<strong>#FORM.GPF#</strong>
</TD>
</TR>
<TR>
<TD COLSPAN="4">GPF Donation ID ##: <strong>#FORM.gpfID#</strong>
</TD>
</TR>
<TR>
<TD COLSPAN="4">
<p align="justify">I am requesting formal blanket approval for the purchase of food and/or beverages utilizing a Government Purchase Card (GPC) for payment. This purchase qualifies for a blanket approval since it falls under the category of medical treatment. This request qualifies for a one-month Blanket Approval based on meeting the following requirement(s):</p>						
</TD>
</TR> 												
<TR>
<TD COLSPAN="4"><STRONG>
<CFIF IsDefined("FORM.option1")>
	<CFIF #FORM.option1# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Nutrition Service for Inpatient Meals<BR />
	</CFIF>
<CFELSE>
</CFIF>


<CFIF IsDefined("FORM.option2")>
  <CFIF #FORM.option2# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Medical Therapy involving food preparation (Living Skills Program)<BR />
  </CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option3")>
	<CFIF #FORM.option3# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Refreshments for the Blood Donor Program<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option4")>
	<CFIF #FORM.option4# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Patients in Hospice Program <BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option5")>
	<CFIF #FORM.option5# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Homeless Program<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option6")>
	<CFIF #FORM.option6# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Mental Health Integrated Supportive Action Programs (Day Treatment Centers, etc)<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option7")>
	<CFIF #FORM.option7# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Readjustment Programs (for patients particiapting in psychiatry treatment plans)<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("option8")>
	<CFIF #option8# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Medical Treatment<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("option9")>
	<CFIF #option9# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Medical Research<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("option10")>
	<CFIF #option10# EQ "Yes">
	&nbsp;&nbsp;&nbsp;General Post Funds<BR />
	</CFIF>
<CFELSE>
</CFIF>
</STRONG>
</TD>
</TR>
<TR>
<TD COLSPAN="4">Written description demonstrating justification for using station funds for this purchase:</TD>
</TR>
<TR>
<TD>** Purpose:</TD>
<TD COLSPAN="3"><strong>#FORM.fbPurpose#</strong></TD>
</TR>
<TR>
<TD>** Type of Food/Bev:</TD>
<TD COLSPAN="3"><strong>#FORM.fbType#</strong>
</TD>
</TR>
<TR>
<TD COLSPAN="4">If <strong>ACTIVITY</strong>, indicate the following:</TD>
</TR>
<TR>
<TD> Activity/Event:</TD>
<TD COLSPAN="3"><strong>#FORM.activity#</strong></TD>
</TR>
<TR>
<TD valign="top"> Date:</TD>
<TD COLSPAN="3">FROM: <strong>#FORM.bDate#</strong> To: <strong>#FORM.eDate#</strong></TD>
</TR>
<TR>
<TD> Location:</TD>
<TD COLSPAN="3"><strong>#FORM.location#</strong></TD>
</TR>
<TR>
<TD> Attendees:</TD>
<TD COLSPAN="3"><strong>#FORM.attendees#</strong></TD>
</TR>
<TR>
<TD> Number of Attendees:</TD>
<TD COLSPAN="3"><strong>#FORM.attendees2#</strong></TD>
</TR>
<TR>
<TD COLSPAN="4">
Additonal comment(s) supporting this request:<br>
<strong>#FORM.issue#</strong>
</TD>
</TR>
<TR>
<TD COLSPAN="2" valign="top"> If approved, order will be placed on a GPC by:</TD>
<TD COLSPAN="2" valign="top">
<strong>#FORM.clerk#</strong>
</TD>
</TR>
<TR>
<TD COLSPAN="2" valign="top"><strong>#FORM.rName#</strong><br>
Requester</TD>
<TD COLSPAN="2" valign="top">
<strong>#FORM.rEmail#</strong><br>
Requestor email address
</TD>
</TR>
<TR>
<TD COLSPAN="4"><strong>#FORM.title#</strong><br>
Approving Official Name & Title</TD>
</TR>
<TR>
<TD COLSPAN="2" valign="top"><strong>#FORM.service#</strong>
<br>Service Line</TD>
<TD COLSPAN="2">
<strong>#FORM.aEmail#</strong><br>
Approving Official email address</TD>
</TR>
<TR><TD COLSPAN="4">&nbsp;</TD></TR>
</CFOUTPUT>
</TABLE>
<SPAN style="color:#CCCCCC; font-size:12px">Automated VA FORM 2105</SPAN>
</TD>
<TR>
<TD COLSPAN="3">

<!--- Date Last Modified --->
<P>Application Reviewed/ Updated: July 15, 2009</P>
</TD>
</TR>

</TABLE>
</TD>
</TR>
</TABLE>
</BODY>
</HTML>