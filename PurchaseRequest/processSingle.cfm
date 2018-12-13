<!--- check for changes --->
<CFIF #FORM.change1# EQ "1">
	<cfset FORM.parties=FORM.PartiesA>
</CFIF>
<CFIF #FORM.change2# EQ "1">
	<cfset FORM.type=FORM.typeA>
</CFIF>	
<CFIF #FORM.change3# EQ "1">
	<cfset FORM.clerk=FORM.clerkA>
</CFIF>	
<CFIF #FORM.change4# EQ "1">
	<cfset FORM.service=FORM.serviceA>
</CFIF>	

<!--- write to database --->
<cfquery name="post_single" datasource="FiscalPurchase">
INSERT INTO SinglePurchase (rDate, fcpgpf, amount, GPF,  
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
		<CFIF IsDefined("FORM.option11")>
 	option11,
	</CFIF>
		<CFIF IsDefined("FORM.option12")>
 	option12,
	</CFIF>
		<CFIF IsDefined("FORM.option13")>
 	option13,
	</CFIF>
		<CFIF IsDefined("FORM.option14")>
 	option14,
	</CFIF>	
		<CFIF IsDefined("FORM.option15")>
 	option15,
	</CFIF>
		<CFIF IsDefined("FORM.option16")>
 	option16,
	</CFIF>
	fbPurpose, fbType, activity, edate, location, attendees, attendees2, parties, partiesOther, type, typeOther, issue, clerk, rname, rEmail, title, aEmail, service, rUser, aTrigger, fTrigger, dTrigger)
VALUES ('#FORM.rDate#',
		#FORM.fcpgpf#, 
		#FORM.amount#, 
		'#FORM.GPF#',  
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
		<CFIF IsDefined("FORM.option11")>
 	'#FORM.option11#',
	</CFIF>
		<CFIF IsDefined("FORM.option12")>
 	'#FORM.option12#',
	</CFIF>
		<CFIF IsDefined("FORM.option13")>
 	'#FORM.option13#',
	</CFIF>
		<CFIF IsDefined("FORM.option14")>
 	'#FORM.option14#',
	</CFIF>		 
		<CFIF IsDefined("FORM.option15")>
 	'#FORM.option15#',
	</CFIF>
		<CFIF IsDefined("FORM.option16")>
 	'#FORM.option16#',
	</CFIF>
 		'#FORM.fbPurpose#', 
		'#FORM.fbType#', 
		'#FORM.activity#', 
		'#FORM.edate#', 
		'#FORM.location#', 
		'#FORM.attendees#', 
		'#FORM.attendees2#',
		<CFIF FORM.change1 EQ "0">
		'#FORM.parties#',
		<CFELSE>
		'#FORM.partiesA#',
		</CFIF>
		<CFIF FORM.parties EQ "Other">
		'#FORM.partiesOther#',
		<CFELSE>
		'&nbsp;',
		</CFIF>
		<CFIF FORM.change2 EQ "0">
		'#FORM.type#',
		<CFELSE>
		'#FORM.typeA#',
		</CFIF>
 		<CFIF FORM.type EQ "Other">
		'#FORM.typeOther#',
		<CFELSE>
		'&nbsp;',
		</CFIF>
		'#FORM.issue#',
		<CFIF FORM.change3 EQ "0">
		'#FORM.clerk#',
		<CFELSE>
		'#FORM.clerkA#',
		</CFIF>		 
		'#FORM.rname#', 
		'#FORM.rEmail#', 
		'#FORM.title#', 
		'#FORM.aEmail#',
		<CFIF FORM.change4 EQ "0">
		'#FORM.service#',
		<CFELSE>
		'#FORM.serviceA#',
		</CFIF>		 
		'#FORM.rUser#', 
		0, 
		0, 
		0)
</cfquery> 
 
 
 
 
<cfquery name="get_recordID" datasource="FiscalPurchase">
SELECT TOP 1 recordID, aEmail
FROM SinglePurchase
ORDER BY recordID DESC
</cfquery>

<!--- send email to approving official --->
<cfmail to="#aEmail#" from="eASLDoNotReply@va.gov" subject="F&B Single Purchase Request Submitted" type="html" query="get_recordID">
<p>Please approve / reject the recently submitted Single Purchase Request.</p>
<p>Issue:  <A HREF="https://vaww.eslse.cf.va.gov/BAY/Fiscal/PurchaseRequest/aReviewSingle.cfm?recordID=#recordID#">#FORM.fbPurpose#</a></p>
</cfmail>


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
<TD COLSPAN="2">Approval Request: Food & Beverage - Single Purchase (Number: <strong>#get_RecordID.recordID#</strong>)</TD>
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
<TD COLSPAN="2"> Est Amount of Purchase: $ <strong>#DecimalFormat(FORM.amount)#</strong></TD>
</TR>
<TR>
<TD COLSPAN="4"><sup>1</sup> If GPF: Will the purchase meet intent of the donated funds? 
<strong>#FORM.GPF#</strong>
</TD>
</TR>
<TR>
<TD COLSPAN="4">
<p align="justify">I am requesting formal approval to allow for the purchase of food and/or beverages utilizing a Government Purchase Card (GPC) for payment. Based on my review of the exceptions to the general rule, as it applies to using appropriated funds to procure food and beverages, the use of these funds is justified as it meets the following exception(s):</p>						
</TD>
</TR> 												
<TR>
<TD COLSPAN="4"><STRONG>
<CFIF IsDefined("FORM.option1")>
	<CFIF #FORM.option1# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Agency Hosting a Formal Conference<BR />
	</CFIF>
<CFELSE>
</CFIF>


<CFIF IsDefined("FORM.option2")>
  <CFIF #FORM.option2# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Award Ceremonies under the Government Incentives Awards Act<BR />
  </CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option3")>
	<CFIF #FORM.option3# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Bottled Water<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option4")>
	<CFIF #FORM.option4# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Canteen Promotional Fund<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option5")>
	<CFIF #FORM.option5# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Cultural Events<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option6")>
	<CFIF #FORM.option6# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Focus Groups<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option7")>
	<CFIF #FORM.option7# EQ "Yes">
	&nbsp;&nbsp;&nbsp;General Post Funds<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option8")>
	<CFIF #FORM.option8# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Guest Speakers<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option9")>
	<CFIF #FORM.option9# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Medical Research<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option10")>
	<CFIF #FORM.option10# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Medical Treatment<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option11")>
	<CFIF #FORM.option11# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Perishing Hall Revolving Fund<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option12")>
	<CFIF #FORM.option12# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Routine Agency Meeting Held at Outside Facility Where There Is an All Inclusive Rental Fee<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option13")>
	<CFIF #FORM.option13# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Secretary’s Reception and Representation Expenses<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option14")>
	<CFIF #FORM.option14# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Training Under the Government Employees Training Act<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option15")>
	<CFIF #FORM.option15# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Volunteers: Tour Extends Over Meal Period<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("FORM.option16")>
	<CFIF #FORM.option16# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Working at Official Duty Station under Extreme Conditions<BR />
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
<TD COLSPAN="3"><strong>#FORM.fbType#</strong></TD>
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
<TD COLSPAN="3"><strong>#FORM.eDate#</strong></TD>
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
<TD COLSPAN="4" style="font-size:11px"><em><strong>NOTE:</strong></em> If request is for purchase of food and/or beverage for an award ceremony, the following information must be completed:</TD>
</TR>
<TR>
<TD valign="top">
Whom is the activity for:
</TD>
<TD valign="top">
<strong>#FORM.Parties#</strong><br />
</TD>
<TD COLSPAN="2" VALIGN="top">OTHER: 
<CFIF IsDefined("FORM.partiesOther")><strong>#FORM.partiesOther#</strong><cfelse></CFIF></TD>
</TR>
<TR>
<TD valign="top">Type of request:</TD>
<TD valign="top">
<strong>#FORM.type#</strong>
</TD>
<TD COLSPAN="2" VALIGN="top">OTHER: 
<CFIF IsDefined("FORM.typeOther")><strong>#FORM.typeOther#</strong><cfelse></CFIF></TD>
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