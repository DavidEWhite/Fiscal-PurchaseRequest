<!--- Fiscal - Food & Beverage Single Purchase version 1.01 06/30/2009 --->

<cfset lUser="#GetAuthUser()#">
<!--- Establish todays date --->
<CFSET myDate=Now()>
<CFSET tDate=#DateFormat(myDate , "mm/dd/yyyy")#>
<!--- get selects --->
<!--- services --->
<cfquery name="get_services" datasource="FiscalPurchase">
SELECT service
FROM services
ORDER BY service
</cfquery>
<!--- clerks --->
<cfquery name="get_clerks" datasource="FiscalPurchase">
SELECT clerk
FROM clerks
</cfquery>

<! DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
            "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML>

<HEAD>
	<TITLE>Fiscal - Food & Beverage Blanket Purchase Purchase</TITLE>	
	<META NAME="Creator"  content="Department of Veterans Affairs, Veterans Health Administration, Deputy Under Secretary for Operations and Management, Veterans Integrated Network Office 8, Bay Pines VA Healthcare System, Fiscal">
	<META NAME="Description" CONTENT="This application provides accounting of Food & Beverage Blanket Purchase requests.">
	<META NAME="Keywords" CONTENT="Food, Beverage, Blanket, Purchase">
	<META NAME="Subject" CONTENT="Food & Beverage Blanket Purchase">
	<META NAME="DateCreated" CONTENT="20090715">
	<META NAME="DateReviewed" CONTENT="20100111">	
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
* Modified by Dynamic Drive for minor changes
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

<BODY onLoad="document.memo.fcpgpf.focus()">

<!--- Heading table --->
<TABLE WIDTH="650" border="0" ALIGN="center">
<TR>
<TD colspan="2" align="left" VALIGN="top"><SPAN style="color:#000080; font-size:24px; font-family:'Times New Roman', Times, serif">Department of<BR />Veterans Affairs</SPAN></TD>
<TD ALIGN="right" VALIGN="top"><SPAN style="color:#000080; font-size:30px; font-family:'Times New Roman', Times, serif"><STRONG>Memorandum</STRONG></SPAN></TD>
</TR>
<TR><TD COLSPAN="3">&nbsp;</TD></TR>
<TR><TD COLSPAN="3">
<cfform action="reviewBlanket.cfm" method="post" name="memo">
<TABLE width="100%" border="0">
<TR>
<TD style="color:#000080; font-size:13px; font-family:'Times New Roman', Times, serif">Date:</TD>
<TD COLSPAN="2"><CFOUTPUT>#DateFormat(tDate , "mmmm dd, yyyy")#</CFOUTPUT></TD>
</TR>
<TR>
<TD style="color:#000080; font-size:13px; font-family:'Times New Roman', Times, serif">From:</TD>
<TD COLSPAN="2"><EM>to be completed by the Approving Official</EM></TD>
</TR>
<TR>
<TD style="color:#000080; font-size:13px; font-family:'Times New Roman', Times, serif">Subj:</TD>
<TD COLSPAN="2">Approval Request: Food & Beverage - Blanket Purchase</TD>
</TR>
<TR>
<TD style="color:#000080; font-size:13px; font-family:'Times New Roman', Times, serif">To:</TD>
<TD COLSPAN="2"><cfoutput>#SESSION.director#</cfoutput>, Assistant Director, Bay Pines VA Healthcare System</TD>
</TR>
<TR>
<TD style="color:#000080; font-size:13px; font-family:'Times New Roman', Times, serif">Through:</TD>
<TD COLSPAN="2"><cfoutput>#SESSION.fiscal#</cfoutput>, Chief, Fiscal Service</TD>
</TR>
<TR>
<TD COLSPAN="3">&nbsp;</TD>
</TR>
<TR>
<TD COLSPAN="3">
<STRONG><EM style="font-size:11px">** - Required Fields</EM></STRONG>
<TABLE WIDTH="100%" border="0" ALIGN="center">
<TR>
<TD>** FCP/GPF <SUP>1</SUP></TD>
<TD>
<cfinput type="text" name="fcpgpf" message="Please provde the FCP/GPF this request is against." required="yes" class="textc" size="5">
<INPUT type="hidden" name="fcpgpf_required" value="Please provde the FCP/GPF this request is against."> <EM style="font-size: 11px">numbers only</EM>
</TD>
<TD COLSPAN="2">** Est Amount of Purchase: $ 
<cfinput type="text" name="amount" message="Please provide the cost in dollars and cents" required="yes" class="textc" size="10">
<INPUT type="hidden" name="amount_required" value="Please provde the cost in dollars and cents.">
<br /><EM style="font-size: 11px">dollars.cents only(no commas)</EM></TD>
</TR>
<TR>
<TD COLSPAN="4"><SUP>1</SUP> If GPF: Will the purchase meet intent of the donated funds? 
<SELECT name="GPF" class="textb">
	<OPTION>N/A</OPTION>
	<OPTION>Yes</OPTION>
	<OPTION>No</OPTION>
</SELECT><BR>
GPF Donation ID #: 
<cfinput type="text" name="gpfID" size="20" class="textb">
</TD>
</TR>
<TR>
<TD COLSPAN="4">
<P align="justify">I am requesting formal blanket approval for the purchase of food and/or beverages utilizing a Government Purchase Card (GPC) for payment. This purchase qualifies for a blanket approval since it falls under the category of medical treatment. This request qualifies for a 6-month Blanket Approval based on meeting the following requirement(s): </P>
Place a <STRONG style="font-family: Wingdings 2">P</STRONG> by all exceptions that apply to this food & beverage purchase request:												
</TD>
</TR> 												
<TR>
<TD align="right"><cfinput type="checkbox" name="Option1" value="Yes">&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Nutrition Service for Inpatient Meals</TD>									
</TR>
<TR>
<TD align="right"><cfinput type="checkbox" name="Option2" value="Yes">&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Medical Therapy involving food preparation (Living Skills Program)</TD>									
</TR>
<TR>
<TD align="right"><cfinput type="checkbox" name="Option3" value="Yes">&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Refreshments for the Blood Donor Program</TD>									
</TR>
<TR>
<TD align="right"><cfinput type="checkbox" name="Option4" value="Yes">&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Patients in Hospice Program </TD>									
</TR>
<TR>
<TD align="right"><cfinput type="checkbox" name="Option5" value="Yes">&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Homeless Program</TD>									
</TR>
<TR>
<TD align="right"><cfinput type="checkbox" name="Option6" value="Yes">&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Mental Health Integrated Supportive Action Programs (Day Treatment Centers, etc)
</TD>									
</TR>
<TR>
<TD align="right"><cfinput type="checkbox" name="Option7" value="Yes">&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Readjustment Programs (for patients particiapting in psychiatry treatment plans)</TD>									
</TR>
<TR>
<TD align="right"><cfinput type="checkbox" name="Option8" value="Yes">&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Medical Treatment</TD>									
</TR>
<TR>
<TD align="right"><cfinput type="checkbox" name="Option9" value="Yes">&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Medical Research</TD>									
</TR>
<TR>
<TD align="right"><cfinput type="checkbox" name="Option10" value="Yes">&nbsp;&nbsp;</TD>
<TD COLSPAN="3">General Post Funds</TD>									
</TR>
<TR>
<TD COLSPAN="4">Written description demonstrating justification for using station funds for this purchase.</TD>
</TR>
<TR>
<TD>** Purpose:</TD>
<TD COLSPAN="3">
<cfinput type="text" name="fbPurpose" message="Purpose is a required field" required="yes" size="70" class="textc">
<INPUT type="hidden" name="fbPurpose_required" value="Purpose is a required field.">
</TD>
</TR>
<TR>
<TD>** Type of Food/Bev:</TD>
<TD COLSPAN="3">
<cfinput type="text" name="fbType" message="Type of Food/Bev is a required field" required="yes" size="70" class="textc">
<INPUT type="hidden" name="fbType_required" value="Type of Food/Bev is a required field.">
</TD>
</TR>
<TR>
<TD COLSPAN="4">If <STRONG>ACTIVITY</STRONG>, indicate the following:</TD>
</TR>
<TR>
<TD>** Activity/Event:</TD>
<TD COLSPAN="3">
<cfinput type="text" name="activity" message="Activity/Event is a required field" required="yes" size="70" class="textc">
<INPUT type="hidden" name="activity_required" value="Activity/Event is a required field.   Use N/A if not applicable.">
</TD>
</TR>
<TR>
<TD valign="top" COLSPAN="2">** Date <EM>(may not exceed a 6-month period)</EM>:</TD>
<TD>
From: <cf_datepicker textboxname="BDate"
                          formname="memo"
                          image="arrow_down.gif"
                          font="arial" 
                          fontcolor="black" 
                          dayheadercolor="FFFFFF" 
                          monthcolor="FFFFFF" 
                          othermonthscolor="C9C9C9" 
                          backcolor="FFFFFF" 
                          first_use_on_page="yes" 
                          dateorder="mm/dd/yyyy" 
                          language="english"
                          displayorientation="right">
</TD>
<TD>
To:	<cf_datepicker textboxname="EDate"
                          formname="memo"
                          image="arrow_down.gif"
                          font="arial" 
                          fontcolor="black" 
                          dayheadercolor="FFFFFF" 
                          monthcolor="FFFFFF" 
                          othermonthscolor="C9C9C9" 
                          backcolor="FFFFFF" 
                          first_use_on_page="no" 
                          dateorder="mm/dd/yyyy" 
                          language="english"
                          displayorientation="right">
</TD>
</TR>
<TR>
<TD>** Location:</TD>
<TD COLSPAN="3"><cfinput type="text" name="location" message="Location is a required field." required="yes" class="textc" size="50">
<INPUT type="hidden" name="location_required" value="Location is a required field.   Use N/A if not applicable.">
</TD>
</TR>
<TR>
<TD>** Attendees:</TD>
<TD COLSPAN="3">
<cfinput type="text" name="attendees" message="Attendees is a required field. Use N/A if not applicable." required="yes" class="textc" size="50">
<INPUT type="hidden" name="attendees_required" value="Attendees is a required field.   Use N/A if not applicable.">
</TD>
</TR>
<TR>
<TD>** Number of Attendees:</TD>
<TD COLSPAN="3">
<cfinput type="text" name="attendees2" message="This field requires numbers only. Use 0 if not applicable." validateat="onSubmit" validate="integer" size="5" class="textc">
<INPUT type="hidden" name="attendees2_required" value="Number of Attendees is a required field.   Use 0 if not applicable.">
</TD>
</TR>
<TR>
<TD COLSPAN="4">
Additonal comment(s) supporting this request <EM style="font-size:10px">(limit 250 characters)</EM>:<BR>
<SPAN style="font-size:11px">Please do not use special characters +=-_`~|\[]{}!@#$%^&*(),';:"?&lt;&gt;</SPAN><BR>
<TEXTAREA rows="3" cols="80" name="issue" id="maxcharfield" 
onKeyDown="textbounter(this,'progressbar1',250)" 
onKeyUp="textbounter(this,'progressbar1',250)" 
onFocus="textbounter(this,'progressbar1',250)"  STYLE="background-color:  #F5F5F5; font-weight: bold; font-family: Arial, Helvetica, sans-serif;"></TEXTAREA><BR />
<DIV id="progressbar1" class="progress"></DIV>
<SCRIPT>textbounter(document.getElementById("scroll"),"progressbar1",250)</SCRIPT>
</TD>
</TR>
<TR>
<TD COLSPAN="2">** If approved, order will be placed on a GPC by:</TD>
<TD COLSPAN="2">
<cfselect name="clerk" multiple="no" query="get_clerks" value="clerk" class="textc"></cfselect>
</TD>
</TR>
<TR>
<TD COLSPAN="4">Date of Request: <CFOUTPUT><STRONG>#tDate#</STRONG></CFOUTPUT></TD>
</TR>
<TR>
<TD COLSPAN="2" valign="top">
<cfinput type="text" name="rName" message="Name is a required field." required="yes" class="textc" size="35" >
<INPUT type="hidden" name="rName_required" value="Requester name is a required field.">
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;** Requester Name: <EM style="font-size:12px">Last, First</EM></TD>
<TD COLSPAN="2" valign="top">
<cfinput type="text" name="rEmail" message="Your email  is a required field." required="yes" class="textc" size="40">
<INPUT type="hidden" name="rEmail_required" value="Your email is a required field.">
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** Requestor email address<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<EM style="font-size:10px">(e.g. jane.doe@va.gov)</EM></TD>
</TR>
<TR>
<TD COLSPAN="4"><cfinput type="text" name="title" message="Approving Offical name and title is a required field." required="yes" class="textc" size="70">
<INPUT type="hidden" name="title_required" value="Approving Official is a required field.">
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** Approving Official Name & Title</TD>
</TR>
<TR>
<TD COLSPAN="2" valign="top">
<cfselect name="service" multiple="no" query="get_services" value="service" class="textc"></cfselect>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** Service Line</TD>
<TD COLSPAN="2">
<cfinput type="text" name="aEmail" message="Approving Official email is a required field." required="yes" class="textc" size="40">
<INPUT type="hidden" name="aEmail_required" value="Approving Official email is a required field.">
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;** Approving Official email address<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<EM style="font-size:10px">(e.g. jane.doe@va.gov)</EM></TD>
</TR>
<TR>
<TD COLSPAN="4" align="center"><BR />
<INPUT name="rDate" type="hidden" value="<cfoutput>#tDate#</cfoutput>">
<INPUT name="lUser" type="hidden" value="<cfoutput>#lUser#</cfoutput>">
<INPUT name="s1" type="submit" class="textb" value="  Next  ">&nbsp;&nbsp;<INPUT name="r1" type="reset" class="textb" value="Clear Form">
</TD>
</TR>
</TABLE>
</cfform>
<SPAN style="color:#CCCCCC; font-size:12px">Automated VA FORM 2105</SPAN>
</TD>
<TR>
<TD COLSPAN="3">
	<DIV ALIGN="right">
	<A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>

<!--- Date Last Modified --->
<P>Application Reviewed/ Updated: January 11, 2010</P>
</TD>
</TR>

</TABLE>
</TD>
</TR>
</TABLE>
</BODY>
</HTML>