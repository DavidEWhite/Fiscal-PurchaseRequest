
<!--- get record --->
<cfquery name="get_record" datasource="FiscalPurchase" dbtype="ODBC">
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
	<META NAME="Description" CONTENT="This application provides accounting of Food & Beverage Single Purchase requests.">
	<META NAME="Keywords" CONTENT="Food, Beverage, Single, Purchase">
	<META NAME="Subject" CONTENT="Food & Beverage Single Purchase">
	<META NAME="DateCreated" CONTENT="20090715">
	<META NAME="DateReviewed" CONTENT="20090715">	
	<META NAME="Language" CONTENT="en">
	<META NAME="Type" CONTENT="Interactive Resource">
   	<LINK REL=stylesheet HREF="style.css" TYPE="text/css">

<!--- Progress bar script --->
<STYLE type="text/css">

.progress{
	width: 1px;
	height: 14px;
	color: white;
	font-size: 12px;
  overflow: hidden;
	background-color: navy;
	padding-left: 5px;
}

</STYLE>

<SCRIPT type="text/JavaScript">


/***********************************************
* Form Field Progress Bar- By Ron Jonk- http://www.euronet.nl/~jonkr/
* Modified by Dynamic Drive for minor Changes
* Script featured/ available at Dynamic Drive- http://www.dynamicdrive.com
* Please keep this notice intact
***********************************************/

function textbounter(field,counter,maxlimit,linecounter) {
	// text width//
	var fieldWidth =  parseInt(field.offsetWidth);
	var charcnt = field.value.length;        

	// trim the extra text
	if (charcnt > maxlimit) { 
		field.value = field.value.substring(0, maxlimit);
	}

	else { 
	// progress bar percentage
	var percentage = parseInt(100 - (( maxlimit - charcnt) * 100)/maxlimit) ;
	document.getElementById(counter).style.width =  parseInt((fieldWidth*percentage)/100)+"px";
	document.getElementById(counter).innerHTML="Limit: "+percentage+"%"
	// color correction on style from CCFFF -> CC0000
	setcolor(document.getElementById(counter),percentage,"background-color");
	}
}

function setcolor(obj,percentage,prop){
	obj.style[prop] = "rgb(80%,"+(100-percentage)+"%,"+(100-percentage)+"%)";
}

</SCRIPT>
</HEAD>
<BODY onLoad="document.memo.title.focus()">
<CFOUTPUT query="get_record">
<!--- Heading table --->
<TABLE WIDTH="650" border="0" ALIGN="center">
<TR>
<TD colspan="2" align="left" VALIGN="top"><span style="color:##000080; font-size:24px; font-family:'Times New Roman', Times, serif">Department of<br />Veterans Affairs</span></TD>
<TD ALIGN="right" VALIGN="top"><span style="color:##000080; font-size:30px; font-family:'Times New Roman', Times, serif"><STRONG>Memorandum</STRONG></span></TD>
</TR>
<TR><TD COLSPAN="3">&nbsp;</TD></TR>
<TR><TD COLSPAN="3">

<TABLE width="100%" border="0">
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Date:</TD>
<TD COLSPAN="2"><CFOUTPUT>#DateFormat(rDate , "mmmm dd, yyyy")#</CFOUTPUT></TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">From:</TD>
<TD COLSPAN="2"><em>to be completed by the Approving Official</em></TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Subj:</TD>
<TD COLSPAN="2">Approval Request: Food & Beverage - Blanket Purchase (Number: <strong>#recordID#</strong>)</TD>
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
<TH COLSPAN="3" style="font-variant:small-caps">- - - Review by Approving Authority - - -</TD>
</TR>
<TR>
<TD COLSPAN="3">
<strong><em style="font-size:11px">** - Required Fields</em></strong>
<TABLE WIDTH="100%" border="0" ALIGN="center">
<TR>
<TD>FCP/GPF <sup>1</sup></TD>

<TD>#fcpgpf#</TD>
<TD COLSPAN="2">Est Amount of Purchase: $ #amount#</TD>
</TR>
<TR>
<TD COLSPAN="4"><sup>1</sup> If GPF: Will the purchase meet intent of the donated funds? #GPF#
</TD>
</TR>
<TR>
<TD>GPF Donation ID ##</TD>
<TD COLSPAN="3">
#gpfID#
</TD>
<TR>
<TD COLSPAN="4">
<p align="justify">I am requesting formal blanket approval for the purchase of food and/or beverages utilizing a Government Purchase Card (GPC) for payment. This purchase qualifies for a blanket approval since it falls under the category of medical treatment. This request qualifies for a 6-month Blanket Approval based on meeting the following requirement(s):</p>
</TD>
</TR> 												
<TR>
<TD colspan="4">
<CFIF IsDefined("option1")>
	<CFIF #option1# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Nutrition Service for Inpatient Meals<BR />
	</CFIF>
<CFELSE>
</CFIF>


<CFIF IsDefined("option2")>
  <CFIF #option2# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Medical Therapy involving food preparation (Living Skills Program)<BR />
  </CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("option3")>
	<CFIF #option3# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Refreshments for the Blood Donor Program<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("option4")>
	<CFIF #option4# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Patients in Hospice Program <BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("option5")>
	<CFIF #option5# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Homeless Program<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("option6")>
	<CFIF #option6# EQ "Yes">
	&nbsp;&nbsp;&nbsp;Mental Health Integrated Supportive Action Programs (Day Treatment Centers, etc)<BR />
	</CFIF>
<CFELSE>
</CFIF>

<CFIF IsDefined("option7")>
	<CFIF #option7# EQ "Yes">
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
</TR>
<TR>
<TD COLSPAN="4">Written description demonstrating justification for using station funds for this purchase:</TD>
</TR>
<TR>
<TD>** Purpose:</TD>
<TD COLSPAN="3"><strong>#fbPurpose#</strong></TD>
</TR>
<TR>
<TD>** Type of Food/Bev:</TD>
<TD COLSPAN="3"><strong>#fbType#</strong>
</TD>
</TR>
<TR>
<TD COLSPAN="4">If <strong>ACTIVITY</strong>, indicate the following:</TD>
</TR>
<TR>
<TD>Activity/Event:</TD>
<TD COLSPAN="3">#activity#</TD>
</TR>
<TR>
<TD valign="top" COLSPAN="2">Date <em>(may not exceed a 6-month period)</em>:</TD>
<TD>From: <strong>#DateFormat(bDate , "mm/dd/yyyy")#</strong></TD>
<TD>To: <strong>#DateFormat(eDate , "mm/dd/yyyy")#</strong></TD>
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
<TR>
<TD COLSPAN="4">
Additonal comment(s) supporting this request:<br>
#issue#

</TD>
</TR>
<TR>
<TD COLSPAN="2" valign="top">If approved, order will be placed on a GPC by:</TD>
<TD COLSPAN="2" valign="top">
<CFIF clerk EQ "Select >>">
<CFELSE>
<strong>#clerk#</strong>
</CFIF>
</TD>
</TR>
<TR>
<TD COLSPAN="4">Date of Request: <strong>#DateFormat(rDate , "mm/dd/yyyy")#</strong></TD>
</TR>
<TR>
<TD COLSPAN="2" valign="top">#rName#<br>
Requester Name: </TD>
<TD COLSPAN="2" valign="top">
#rEmail#<br>
Requestor email address<br>
</TD>
</TR>
<TR>
<TD COLSPAN="2" valign="top">
<strong>#service#</strong><br />
Service Line</TD>
<TD COLSPAN="2">
#aEmail#<br>Approving Official email address
</TD>
</TR>
<CFIF #aTrigger# EQ "0">
<cfform action="processAReviewBlanket.cfm" method="post" name="memo">
<TR>
<TD COLSPAN="4">** Approving Official Name & Title:<br>
<cfinput type="text" name="title" message="Approving Offical name and title is a required field." required="yes" class="textc" value="#title#" size="70">
</TD>
</TR>
<TR>
<TD colspan="4">
Approving Official Comments <em style="font-size:10px">(limit 250 characters)</em>:<br />
<TEXTAREA rows="3" cols="90" name="aComment" id="maxcharfield" 
onKeyDown="textbounter(this,'progressbar1',250)" 
onKeyUp="textbounter(this,'progressbar1',250)" 
onFocus="textbounter(this,'progressbar1',250)"  STYLE="background-color:  ##F5F5F5; font-weight: bold; font-family: Arial, Helvetica, sans-serif;"></TEXTAREA><BR />
<DIV id="progressbar1" class="progress"></DIV>
<SCRIPT>textbounter(document.getElementById("scroll"),"progressbar1",250)</SCRIPT>
</TD>
</TR>
<TR>
<TD colspan="2"><input name="aTrigger" type="radio" value="1" checked> Approve</TD>
<TD colspan="2"><input name="aTrigger" type="radio" value="2"> Disapprove</TD>
</TR>
<TR>
<TD COLSPAN="4" align="center"><br />
<input name="recordID" type="hidden" value="#recordID#">
<input name="s1" type="submit" class="textb" value="  Process Request  ">
</TD>
</TR>
</TABLE>
</cfform>
</CFIF>

<CFIF #aTrigger# EQ "1" OR #aTrigger# EQ "2">
<h5 align="center">This request has been acted upon and cannot be edited again</h5>
View <a href="index.cfm">Reports</a> for more information on #recordID#.
</CFIF>
</CFOUTPUT>

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

