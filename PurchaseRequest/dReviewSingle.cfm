<!--- get record --->
<cfquery name="get_record" datasource="FiscalPurchase" dbtype="ODBC">
SELECT *
FROM singlePurchase
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

<CFOUTPUT query="get_record">
<BODY onLoad="document.memo.dComment.focus()">
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
<TD COLSPAN="2">#DateFormat(rDate , "mmmm dd, yyyy")#</TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">From:</TD>
<TD COLSPAN="2">#Title#, #service#</TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Subj:</TD>
<TD COLSPAN="2">Approval Request: Food & Beverage - Single Purchase (Number: <strong>#recordID#</strong>)</TD>
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
<TH COLSPAN="3" style="font-variant:small-caps">- - - Review by Director - - -</TD>
</TR>
<TR>
<TD COLSPAN="3">
<TABLE WIDTH="100%" border="0" ALIGN="center">
<TR>
<TD>FCP/GPF <sup>1</sup></TD>
<TD>#fcpgpf#</TD>
<TD COLSPAN="2">Est Amount of Purchase: $ #DecimalFormat(amount)#</TD>
</TR>
<TR>
<TD COLSPAN="4"><sup>1</sup> If GPF: Will the purchase meet intent of the donated funds? 
#GPF#
</TD>
</TR>
<TR>
<TD COLSPAN="4">
<p align="justify">I am requesting formal approval to allow for the purchase of food and/or beverages utilizing a Government Purchase Card (GPC) for payment. Based on my review of the exceptions to the general rule, as it applies to using appropriated funds to procure food and beverages, the use of these funds is justified as it meets the following exception(s):</p>
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
<TD COLSPAN="3"></TD>									
</TR>
<TR>
<TD COLSPAN="4">Written description demonstrating justification for using station funds for this purchase.</TD>
</TR>
<TR>
<TD>Purpose:</TD>
<TD COLSPAN="3"><strong>#fbPurpose#</strong></TD>
</TR>
<TR>
<TD>Type of Food/Bev:</TD>
<TD COLSPAN="3"><strong>#fbType#</strong></TD>
</TR>
<TR>
<TD COLSPAN="4">If <strong>ACTIVITY</strong>, indicate the following:</TD>
</TR>
<TR>
<TD>Activity/Event:</TD>
<TD COLSPAN="3">#activity#</TD>
</TR>
<TR>
<TD valign="top" COLSPAN="4">Date: <strong>#DateFormat(eDate , "mm/dd/yyyy")#</strong></TD>
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
<TD COLSPAN="4" style="font-size:11px"><em><strong>NOTE:</strong></em> If request is for purchase of food and/or beverage for an award ceremony, 
the following information must be completed:</TD>
</TR>
<TR>
<TD>Whom is the activity for:</TD>
<TD valign="top">
<CFIF #parties# EQ "Select >>">
No choice selected
<CFELSE>
#parties#
</CFIF>
</TD>
<TD COLSPAN="2" VALIGN="top">
<CFIF #parties# EQ "Other">
OTHER: #partiesOther#
<CFELSE> </CFIF></TD>
</TR>
<TR>
<TD>Type of request:</TD>
<TD>
<CFIF #type# EQ "Select >>">
No choice selected
<CFELSE>
#type#
</CFIF>
</TD>
<TD COLSPAN="2" VALIGN="top">
<CFIF #type# EQ "Other">
OTHER: #typeOther#
<CFELSE> </CFIF>
</TD>
</TR>
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
No choice selected
<CFELSE>
<strong>#clerk#</strong>
</CFIF>
</TD>
</TR>
<TR>
<TD COLSPAN="2" valign="top">#rName#<br>
Requester Name: </TD>
<TD COLSPAN="2" valign="top">
#rUser#<br>
Requestor Domain\Username<br>
</TD>
</TR>
<TR>
<TD colspan="4">
Approving Official Comments:<br />
#aComment#
</TD>
</TR>
<TR>
<TD colspan="2" valign="top">Approved (#DateFormat(aDate , "mm/dd/yyyy")#)</TD>
<TD colspan="2" valign="top">
#aUser#<br>
Approving Official Domain\Username<br>
</TD>
</TR>
<TR>
<TD colspan="4">
Fiscal Officer Comments:<br />
#fComment#
</TD>
</TR>
<TR>
<TD colspan="2">Approved (#DateFormat(fDate, "mm/dd/yyyy")#)</TD>
<TD colspan="2" valign="top">
#fUser#<br>
Fiscal Official Domain\Username<br>
</TD>
</TR>
<cfform action="processDReviewSingle.cfm" method="post" name="memo">
<TR>
<TD colspan="4">
<h1 align="center">Director</h1> 
Comments <em style="font-size:10px">(limit 250 characters)</em>:<br />
<TEXTAREA rows="3" cols="90" name="dComment" id="maxcharfield" 
onKeyDown="textbounter(this,'progressbar1',250)" 
onKeyUp="textbounter(this,'progressbar1',250)" 
onFocus="textbounter(this,'progressbar1',250)"  STYLE="background-color:  ##F5F5F5; font-weight: bold; font-family: Arial, Helvetica, sans-serif;"></TEXTAREA><BR />
<DIV id="progressbar1" class="progress"></DIV>
<SCRIPT>textbounter(document.getElementById("scroll"),"progressbar1",250)</SCRIPT>
</TD>
</TR>
<TR>
<TD colspan="2"><input name="dTrigger" type="radio" value="1" checked> Approve</TD>
<TD colspan="2"><input name="dTrigger" type="radio" value="2"> Disapprove</TD>
</TR>
<TR>
<TD COLSPAN="4" align="center"><br />
<input name="recordID" type="hidden" value="#recordID#">
<input name="s1" type="submit" class="textb" value="  Process Request  ">
</TD>
</TR>
</TABLE>
</cfform></CFOUTPUT>
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

