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

<BODY onLoad="document.memo.fcpgpf.focus()">
<!--- Heading table --->
<TABLE WIDTH="650" border="0" ALIGN="center">
<TR>
<TD colspan="2" align="left" VALIGN="top"><span style="color:#000080; font-size:24px; font-family:'Times New Roman', Times, serif">Department of<br />Veterans Affairs</span></TD>
<TD ALIGN="right" VALIGN="top"><span style="color:#000080; font-size:30px; font-family:'Times New Roman', Times, serif"><STRONG>Memorandum</STRONG></span></TD>
</TR>
<TR><TD COLSPAN="3">&nbsp;</TD></TR>
<TR><TD COLSPAN="3">
<!--- evaluate for service --->
<CFIF #FORM.service# EQ "Select >>">
<h4 align="center">Problem with request:</h4>
<H5 align="center">You must choose a Service to continue.</H5>
<DIV ALIGN="center">
<INPUT onclick=history.go(-1) class="textc" type=button value="  BACK  ">
</DIV>
<P>&nbsp;</P>
<P>&nbsp;</P>
<CFELSE>
	<!--- evaluate for clerk field --->
	<CFIF #FORM.clerk# EQ "Select >>">
	<h4 align="center">Problem with request:</h4>
	<H5 align="center">You must decide "If approved, order will be placed on a GPC by ..." to continue.</H5>
<DIV ALIGN="center">
<INPUT onclick=history.go(-1) class="textc" type=button value="  BACK  ">
</DIV>
<P>&nbsp;</P>
<P>&nbsp;</P>
	<CFELSE>
		<!--- evaluate for email fields --->
		<CFIF #FORM.rEmail# EQ "#FORM.aEmail#">
		<h4 align="center">Problem with request:</h4>
		<H5 align="center">Requester's email address and Authorizing Official's email address can not be same.</H5>
		<DIV ALIGN="center">
		<INPUT onclick=history.go(-1) class="textc" type=button value="  BACK  ">
		</DIV>
		<P>&nbsp;</P>
		<P>&nbsp;</P>
		<CFELSE>
<!--- validate email --->
<cfset rEmail = "#FORM.remail#">
<cfset aEmail = "#FORM.aemail#">
<cfif REFindNocase("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@va.gov$", rEmail) AND REFindNocase("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@va.gov$", aEmail)>	
<cfform action="processDuplicateBlanket.cfm" method="post" name="memo">
<CFOUTPUT>
<TABLE width="100%" border="0">
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Date:</TD>
<TD COLSPAN="2">#DateFormat(FORM.rDate , "mmmm dd, yyyy")#</TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">From:</TD>
<TD COLSPAN="2"><em>#FORM.title#</em></TD>
</TR>
<TR>
<TD style="color:##000080; font-size:13px; font-family:'Times New Roman', Times, serif">Subj:</TD>
<TD COLSPAN="2">Approval Request: Food & Beverage - Blanket Purchase</TD>
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
<TH COLSPAN="3" style="font-variant:small-caps">- - - Review Before Final Submission - - -</TD>
</TR>
<TR>
<TD COLSPAN="3">
<strong><em style="font-size:11px">** - Required Fields</em></strong>
<TABLE WIDTH="100%" border="0" ALIGN="center">
<TR>
<TD>** FCP/GPF <sup>1</sup></TD>

<TD><cfinput type="text" name="fcpgpf" message="Please provde the FCP/GPF this request is against." required="yes" class="textc" value="#FORM.fcpgpf#" size="5">
<INPUT type="hidden" name="fcpgpf_required" value="Please provide the FCP/GPF this request is against."> <em style="font-size: 11px">numbers only</em>
</TD>
<TD COLSPAN="2">** Est Amount of Purchase: $ 
<cfinput type="text" name="amount" message="Please provide the cost in dollars and cents" required="yes" class="textc" value="#FORM.amount#">
<INPUT type="hidden" name="amount_required" value="Please provide the cost in dollars and cents.">
</TD>
</TR>
<TR>
<TD COLSPAN="4"><sup>1</sup> If GPF: Will the purchase meet intent of the donated funds? 
<cfif #FORM.GPF# EQ "N/A">
<select name="GPF" class="textb">
	<option>N/A</option>
	<option>Yes</option>
	<option>No</option>
</select>
</cfif>
<cfif #FORM.GPF# EQ "Yes">
<select name="GPF" class="textb">
	<option>Yes</option>
	<option>N/A</option>
	<option>No</option>
</select>
</cfif>
<cfif #FORM.GPF# EQ "No">
<select name="GPF" class="textb">
	<option>No</option>	
	<option>N/A</option>
	<option>Yes</option>

</select>
</cfif>
</TD>
</TR>
<TR>
<TD>GPF Donation ID ##:</TD>
<TD COLSPAN="3">
<CFIF IsDefined("FORM.gpfID")>
<cfinput type="text" name="gpfID" class="textb" value="#FORM.gpfID#" size="20">
<CFELSE>
<cfinput type="text" name="gpfID" class="textb" size="20">
</CFIF>
</TD>
<TR>
<TD COLSPAN="4">
<p align="justify">I am requesting formal blanket approval for the purchase of food and/or beverages utilizing a Government Purchase Card (GPC) for payment. This purchase qualifies for a blanket approval since it falls under the category of medical treatment. This request qualifies for a 6-month Blanket Approval based on meeting the following requirement(s):</p>
Place a <strong style="font-family: Wingdings 2">P</strong> by all exceptions that apply to this food & beverage purchase request:												
</TD>
</TR> 												
<TR>
<TD align="right">
<CFIF IsDefined("FORM.option1")>
	<CFIF #FORM.option1# EQ "Yes">
	<cfinput type="checkbox" name="Option1" checked="true" value="Yes">
	</CFIF>
<CFELSE>
<cfinput type="checkbox" name="Option1" value="Yes">
</CFIF>
&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Nutrition Service for Inpatient Meals</TD>									
</TR>
<TR>
<TD align="right">
<CFIF IsDefined("FORM.option2")>
  <CFIF #FORM.option2# EQ "Yes">
<cfinput type="checkbox" name="Option2" checked="true" value="Yes">
  </CFIF>
<CFELSE>
<cfinput type="checkbox" name="Option2" value="Yes">
</CFIF>&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Medical Therapy involving food preparation (Living Skills Program)</TD>									
</TR>
<TR>
<TD align="right">
<CFIF IsDefined("FORM.option3")>
	<CFIF #FORM.option3# EQ "Yes">
	<cfinput type="checkbox" name="Option3" checked="true" value="Yes">
	</CFIF>
<CFELSE>
<cfinput type="checkbox" name="Option3" value="Yes">
</CFIF>&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Refreshments for the Blood Donor Program</TD>									
</TR>
<TR>
<TD align="right">
<CFIF IsDefined("FORM.option4")>
	<CFIF #FORM.option4# EQ "Yes">
	<cfinput type="checkbox" name="Option4" checked="true" value="Yes">
	</CFIF>
<CFELSE>
<cfinput type="checkbox" name="Option4" value="Yes">
</CFIF>&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Patients in Hospice Program</TD>									
</TR>
<TR>
<TD align="right">
<CFIF IsDefined("FORM.option5")>
	<CFIF #FORM.option5# EQ "Yes">
	<cfinput type="checkbox" name="Option5" checked="true" value="Yes">
	</CFIF>
<CFELSE>
<cfinput type="checkbox" name="Option5" value="Yes">
</CFIF>&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Homeless Program</TD>									
</TR>
<TR>
<TD align="right">
<CFIF IsDefined("FORM.option6")>
	<CFIF #FORM.option6# EQ "Yes">
	<cfinput type="checkbox" name="Option6" checked="true" value="Yes">
	</CFIF>
<CFELSE>
<cfinput type="checkbox" name="Option6" value="Yes">
</CFIF>&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Mental Health Integrated Supportive Action Programs (Day Treatment Centers, etc)</TD>									
</TR>
<TR>
<TD align="right">
<CFIF IsDefined("FORM.option7")>
	<CFIF #FORM.option7# EQ "Yes">
	<cfinput type="checkbox" name="Option7" checked="true" value="Yes">
	</CFIF>
<CFELSE>
<cfinput type="checkbox" name="Option7" value="Yes">
</CFIF>&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Readjustment Programs (for patients particiapting in psychiatry treatment plans)</TD>									
</TR>
<TR>
<TD align="right">
<CFIF IsDefined("FORM.option8")>
	<CFIF #FORM.option8# EQ "Yes">
	<cfinput type="checkbox" name="Option8" checked="true" value="Yes">
	</CFIF>
<CFELSE>
<cfinput type="checkbox" name="Option8" value="Yes">
</CFIF>&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Medical Treatment</TD>									
</TR>
<TR>
<TD align="right">
<CFIF IsDefined("FORM.option9")>
	<CFIF #FORM.option9# EQ "Yes">
	<cfinput type="checkbox" name="Option9" checked="true" value="Yes">
	</CFIF>
<CFELSE>
<cfinput type="checkbox" name="Option9" value="Yes">
</CFIF>&nbsp;&nbsp;</TD>
<TD COLSPAN="3">Medical Research</TD>									
</TR>
<TR>
<TD align="right">
<CFIF IsDefined("FORM.option10")>
	<CFIF #FORM.option10# EQ "Yes">
	<cfinput type="checkbox" name="Option10" checked="true" value="Yes">
	</CFIF>
<CFELSE>
<cfinput type="checkbox" name="Option10" value="Yes">
</CFIF>&nbsp;&nbsp;</TD>
<TD COLSPAN="3">General Post Funds </TD>									
</TR>
<TR>
<TD COLSPAN="4">Written description demonstrating justification for using station funds for this purchase.</TD>
</TR>
<TR>
<TD>** Purpose:</TD>
<TD COLSPAN="3">
<cfinput type="text" name="fbPurpose" message="Purpose is a required field" required="yes" class="textc" value="#FORM.fbPurpose#" size="70">
<INPUT type="hidden" name="fbPurpose_required" value="Purpose is a required field.">
</TD>
</TR>
<TR>
<TD>** Type of Food/Bev:</TD>
<TD COLSPAN="3">
<cfinput type="text" name="fbType" message="Type of Food/Bev is a required field" required="yes" class="textc" value="#FORM.fbType#" size="70">
<INPUT type="hidden" name="fbType_required" value="Type of Food/Bev is a required field.">
</TD>
</TR>
<TR>
<TD COLSPAN="4">If <strong>ACTIVITY</strong>, indicate the following:</TD>
</TR>
<TR>
<TD>** Activity/Event:</TD>
<TD COLSPAN="3">
<cfinput type="text" name="activity" message="Activity/Event is a required field" required="yes" class="textc" value="#FORM.activity#" size="70">
<INPUT type="hidden" name="activity_required" value="Activity/Event is a required field.   Use N/A if not applicable.">
</TD>
</TR>
<TR>
<TD valign="top" COLSPAN="2">** Date <em>(may not exceed a 6-month period)</em>:</TD>
<TD>From: <strong>#FORM.bDate#</strong></TD>
<TD>To: <strong>#FORM.eDate#</strong></TD>
</TR>
<TR>
<TD COLSPAN="2" align="right" valign="top">Change Date choices?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
<input name="Change1" type="radio" value="1" class="textc" /> Yes 
<input name="Change1" type="radio" value="0" checked class="textc" /> No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
<em style="font-size:11px">Yes, you must change both New From and New To</em></TD>
<TD>
New From: <cf_datepicker textboxname="BDateA"
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
New To:	<cf_datepicker textboxname="EDateA"
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
<TD COLSPAN="3">
<cfinput type="text" name="location" message="Location is a required field." required="yes" class="textc" value="#FORM.location#" size="50">
<INPUT type="hidden" name="location_required" value="Location is a required field.   Use N/A if not applicable.">
</TD>
</TR>
<TR>
<TD>** Attendees:</TD>
<TD COLSPAN="3">
<cfinput type="text" name="attendees" message="Attendees is a required field. Use N/A if not applicable." required="yes" class="textc"value="#FORM.attendees#" size="50">
<INPUT type="hidden" name="attendees_required" value="Attendees is a required field.   Use N/A if not applicable.">
</TD>
</TR>
<TR>
<TD>** Number of Attendees:</TD>
<TD COLSPAN="3">
<cfinput type="text" name="attendees2" message="This field requires numbers only. Use 0 if not applicable." range="0,10000" validateat="onSubmit" validate="integer" class="textc" value="#FORM.attendees2#" size="5">
<INPUT type="hidden" name="attendees2_required" value="Number of Attendees is a required field.   Use 0 if not applicable.">
</TD>
</TR>
<TR>
<TR>
<TD COLSPAN="4">
Additonal comment(s) supporting this request <em style="font-size:10px">(limit 250 characters)</em>:<br>
<span style="font-size:11px">Please do not use special characters +=-_`~|\[]{}!@##$%^&*(),';:"?&lt;&gt;</span><br>
<TEXTAREA rows="3" cols="80" name="issue" id="maxcharfield" 
onKeyDown="textbounter(this,'progressbar1',250)" 
onKeyUp="textbounter(this,'progressbar1',250)" 
onFocus="textbounter(this,'progressbar1',250)"  STYLE="background-color:  ##F5F5F5; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">#FORM.issue#</TEXTAREA><BR />
<DIV id="progressbar1" class="progress"></DIV>
<SCRIPT>textbounter(document.getElementById("scroll"),"progressbar1",250)</SCRIPT>
</TD>
</TR>
<TR>
<TD COLSPAN="2" valign="top">** If approved, order will be placed on a GPC by:</TD>
<TD COLSPAN="2" valign="top">
Choice - <strong>#FORM.clerk#</strong><br />
Change? 
<input name="Change2" type="radio" value="1" class="textc" /> Yes 
<input name="Change2" type="radio" value="0" checked class="textc" /> No<BR />
<cfselect name="clerkA" multiple="no" query="get_clerks" value="clerk" class="textc"></cfselect>
</TD>
</TR>
<TR>
<TD COLSPAN="4">Date of Request: <CFOUTPUT><strong>#FORM.rDate#</strong></CFOUTPUT></TD>
</TR>
<TR>
<TD COLSPAN="2" valign="top">
<cfinput type="text" name="rName" message="Name is a required field." required="yes" class="textc" value="#FORM.rName#" size="35" >
<INPUT type="hidden" name="rName_required" value="Requester Name is a required field.">
<br>
&nbsp;&nbsp;&nbsp;&nbsp;** Requester Name: <em style="font-size:12px">Last, First</em></TD>
<TD COLSPAN="2" valign="top">#FORM.rEmail#<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** Requestor email address<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<em style="font-size:10px">(e.g. jane.doe@va.gov)</em></TD>
</TR>
<TR>
<TD COLSPAN="4">
<cfinput type="text" name="title" message="Approving Offical name and title is a required field." required="yes" class="textc" value="#FORM.title#" size="70">
<INPUT type="hidden" name="title_required" value="Approving Official name and title is a required field.">
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** Approving Official Name & Title</TD>
</TR>
<TR>
<TD COLSPAN="2" valign="top">
Choice - <strong>#FORM.service#</strong><br />
Change? 
<input name="Change3" type="radio" value="1" class="textc" /> Yes 
<input name="Change3" type="radio" value="0" checked class="textc" /> No<BR />
<cfselect name="serviceA" multiple="no" query="get_services" value="service" class="textc"></cfselect>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** Service Line</TD>
<TD COLSPAN="2">#FORM.aEmail#<br>
&nbsp;&nbsp;&nbsp;&nbsp;** Approving Official email address<br>
&nbsp;&nbsp;&nbsp;&nbsp;<em style="font-size:10px">(e.g. jane.doe@va.gov)</em></TD>
</TR>
<TR>
<TD COLSPAN="4" align="center"><br />
<input name="bDate" type="hidden" value="#FORM.bDate#">
<input name="eDate" type="hidden" value="#FORM.eDate#">
<input name="clerk" type="hidden" value="#FORM.clerk#">
<input name="service" type="hidden" value="#FORM.service#">
<input name="rEmail" type="hidden" value="#FORM.rEmail#">
<input name="aEmail" type="hidden" value="#FORM.aEmail#">
<input name="rDate" type="hidden" value="#FORM.rDate#">
</CFOUTPUT>
<input name="s1" type="submit" class="textb" value="  Submit Request  ">

</TD>
</TR>
</TABLE>
</cfform>
<cfelse>

<!--- email not valid ---> 
<DIV align="center">
<h4 align="center">Problem with request</h4>
<h5 align="center">You must use a valid VA <em>(Exchange/Outlook)</em> email address&nbsp;&nbsp;&nbsp;&nbsp;<em>(first.last@va.gov)</em></h5>&nbsp;&nbsp;&nbsp;&nbsp;
<INPUT onclick=history.go(-1) class="textc" type=button value="  BACK  "></DIV>
<p>&nbsp;</p>
</cfif>
		</CFIF>
	</CFIF>
</CFIF>

<SPAN style="color:#CCCCCC; font-size:12px">Automated VA FORM 2105</SPAN>
</TD>
</TR>
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