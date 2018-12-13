
<!--- all submissions --->
<CFIF #FORM.reportType# EQ "1">
<CFIF #FORM.collate# EQ "1">
<!--- single purchase --->
<cfquery name="get_list1" datasource="FiscalPurchase">
SELECT service, recordID, rName, fcpgpf, fbPurpose, activity, amount, aDate, fDate, dDate, atrigger, fTrigger, dtrigger
FROM singlePurchase
WHERE (rDate BETWEEN (###FORM.bDate###) AND (###FORM.eDate###))
ORDER BY RecordID DESC
</cfquery>
<!--- blanket purchase --->
<cfquery name="get_list2" datasource="FiscalPurchase">
SELECT service, recordID, rName, fcpgpf, fbPurpose, activity, amount, aDate, fDate, atrigger, fTrigger, dtrigger
FROM blanketPurchase
WHERE (rDate BETWEEN (###FORM.bDate###) AND (###FORM.eDate###))
ORDER BY RecordID DESC
</cfquery>
</CFIF>
<!--- by Service --->
<CFIF #FORM.collate# EQ "2">
<!--- single purchase --->
<cfquery name="get_list1" datasource="FiscalPurchase">
SELECT service, recordID, rName, fcpgpf, fbPurpose, activity, amount, aDate, fDate, dDate, atrigger, fTrigger, dtrigger
FROM singlePurchase
WHERE ((service='#FORM.service#') 
AND (rDate BETWEEN (###FORM.bDate###) AND (###FORM.eDate###)))
</cfquery>
<!--- blanket purchase --->
<cfquery name="get_list2" datasource="FiscalPurchase">
SELECT service, recordID, rName, fcpgpf, fbPurpose, activity, amount, aDate, fDate, dDate, atrigger, fTrigger, dtrigger
FROM blanketPurchase
WHERE ((service='#FORM.service#') 
AND (rDate BETWEEN (###FORM.bDate###) AND (###FORM.eDate###)))
</cfquery>
</CFIF>
</CFIF>

<!--- approved only --->
<CFIF #FORM.reportType# EQ "2">
<CFIF #FORM.collate# EQ "1">
<!--- single purchase --->
<cfquery name="get_list1" datasource="FiscalPurchase">
SELECT service, recordID, rName, fcpgpf, fbPurpose, activity, amount, aDate, fDate, dDate, atrigger, fTrigger, dtrigger
FROM singlePurchase
WHERE ((dTrigger=1) 
AND (rDate BETWEEN (###FORM.bDate###) AND (###FORM.eDate###)))
ORDER BY Service
</cfquery>
<!--- blanket purchase --->
<cfquery name="get_list2" datasource="FiscalPurchase">
SELECT service, recordID, rName, fcpgpf, fbPurpose, activity, amount, aDate, fDate, atrigger, fTrigger, dtrigger
FROM blanketPurchase
WHERE (((dTrigger=1) OR (dTrigger=2)) 
AND (rDate BETWEEN (###FORM.bDate###) AND (###FORM.eDate###)))
ORDER BY Service
</cfquery>
</CFIF>

<!--- by Service --->
<CFIF #FORM.collate# EQ "2">
<!--- single purchase --->
<cfquery name="get_list1" datasource="FiscalPurchase">
SELECT service, recordID, rName, fcpgpf, fbPurpose, activity, amount, aDate, fDate, dDate, atrigger, fTrigger, dtrigger
FROM singlePurchase
WHERE (((dTrigger=1) OR (dTrigger=2)) 
AND (service='#FORM.service#') 
AND (rDate BETWEEN (###FORM.bDate###) AND (###FORM.eDate###)))
</cfquery>
<!--- blanket purchase --->
<cfquery name="get_list2" datasource="FiscalPurchase">
SELECT service, recordID, rName, fcpgpf, fbPurpose, activity, amount, aDate, fDate, dDate, atrigger, fTrigger, dtrigger
FROM blanketPurchase
WHERE (((dTrigger=1) OR (dTrigger=2)) 
AND (service='#FORM.service#') 
AND (rDate BETWEEN (###FORM.bDate###) AND (###FORM.eDate###)))
</cfquery>
</CFIF>
</CFIF>


<! DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
            "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML>

<HEAD>
	<TITLE>Fiscal Purchase Card Food & Beverage Approval</TITLE>
	<META NAME="Creator"  content="Department of Veterans Affairs, Veterans Health Administration, VISN 8, Bay Pines VAHCS, Fiscal">
	<META NAME="Description" CONTENT="This web-based application is used for locally requesting Purchase Card Food & Beverage Approval.">
	<META NAME="Keywords" CONTENT="Fiscal, Purchase, Card, Food, Beverage, Approval">
	<META NAME="Subject" CONTENT="Fiscal Purchase Card Food & Beverage Approval">
	<META NAME="DateCreated" CONTENT="20090715">
	<META NAME="DateReviewed" CONTENT="20090715">
	<META NAME="Language" CONTENT="en">
	<META NAME="Type" CONTENT="Interactive Resource">
   	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</HEAD>

<TABLE WIDTH="650" ALIGN="center">
<TR>
<TD WIDTH="25%" VALIGN="top">
<IMG SRC="../sidelogo.gif" ALT="BLDG 20 Bell Tower with two palms" WIDTH="108" HEIGHT="136" BORDER="0">
</TD>
<TD ALIGN="center" WIDTH="50%">
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<br>Purchases Using a Government<br>Purchase Card<br />Processed Requests</H3>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A><br><br>
<a href="index.cfm" CLASS="mini" TITLE="Back">BACK</a></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">
<!--- validate for service --->
<CFIF FORM.collate EQ "2" AND FORM.service EQ " Select >>">
<h5 align="center">To view a report "By Service",<br> please choose a Service from the drop down list<br><br>
<INPUT onclick=history.go(-1) class="textc" type=button value="  BACK  "></h5>
<CFELSE>

<!--- output report --->
<em style="font-size:11px">Select the number for more information<br />
Requests open to a new window.  Close the open window to return here</em>
<!--- single requests --->
<h5 align="center">Single Purchase Requests</h5>
	<CFIF get_list1.RecordCount EQ "0">
	<H2 align="center">There are no records for this category</H2>
	<CFELSE>
<TABLE WIDTH="100%" BORDER="0">
<TR>
<TH width="20" align="center" valign="top" class="mini">Number</TH>
<TH width="95" valign="top" class="mini">Requester</TH>
<TH width="85" valign="top" class="mini">Service</TH>
<TH width="40" valign="top" class="mini">FCP /<br />GPF</TH>
<TH width="107" valign="top" class="mini">Purpose</TH>
<TH width="65" valign="top" class="mini">Activity</TH>
<TH width="65" valign="top" class="mini">Est.Cost</TH>
<TH width="47" valign="top" class="mini">AO Review</TH>
<TH width="47" valign="top" class="mini">Fiscal Review</TH>
<TH width="65" valign="top" class="mini">Director</TH>
</TR>
<CFOUTPUT query="get_list1">
<TR>
<TD valign="top" class="mini" align="center">
<A HREF="viewRequests.cfm?option=1&huh=1&recordID=#recordID#" target="_blank" class="mini">#recordID#</A>
</TD>
<TD valign="top" class="mini">
<CFSET myVar = mid(rName,1,15)>
#myVar#
</TD>
<TD valign="top" class="mini">
<CFSET myVar1 = mid(Service,1,13)>
#myVar1#
</TD>
<TD valign="top" class="mini" align="center">#FCPGPF#</TD>
<TD valign="top" class="mini">
<CFSET myVar2 = mid(fbPurpose,1,15)>
#myVar2#
</TD>
<TD valign="top" class="mini">
<CFSET myVar3 = mid(activity,1,10)>
#myVar3#</TD>
<TD valign="top" class="mini" align="center">$#Decimalformat(amount)#</TD>
<TD valign="top" class="mini">
<CFIF #aTrigger# EQ "1">
#DateFormat(aDate , "mm/dd/yy")#
<CFELSEIF #aTrigger# EQ "2">
Disapproved
<CFELSEIF #aTrigger# EQ "0">
Pending
</CFIF>
</TD>
<TD valign="top" class="mini">
<CFIF #fTrigger# EQ "1">
#DateFormat(fDate , "mm/dd/yy")#
<CFELSEIF #fTrigger# EQ "2">
Disapproved
<CFELSEIF #aTrigger# EQ "2" AND  #fTrigger# EQ "0">
&nbsp;
<CFELSE>
Pending
</CFIF>
</TD>
<TD valign="top" class="mini">
<CFIF #dTrigger# EQ "1">
Approved
<CFELSEIF #dTrigger# EQ "2">
Disapproved
<CFELSEIF #aTrigger# EQ "2" OR #fTrigger# EQ "2" AND  #dTrigger# EQ "0">
&nbsp;
<CFELSE>
Pending
</CFIF>
</TD>
</TR>
</CFOUTPUT>
</TABLE>
</CFIF>
<!--- blanket requests --->
<h5 align="center">Blanket Purchase Requests</h5>
<CFIF get_list2.RecordCount EQ "0">
<H2 align="center">There are no records for this category</H2>
<CFELSE>
<TABLE WIDTH="100%" BORDER="0">
<TR>
<TH width="20" align="center" valign="top" class="mini">Number</TH>
<TH width="95" valign="top" class="mini">Requester</TH>
<TH width="85" valign="top" class="mini">Service</TH>
<TH width="40" valign="top" class="mini">FCP /<br />GPF</TH>
<TH width="107" valign="top" class="mini">Purpose</TH>
<TH width="65" valign="top" class="mini">Activity</TH>
<TH width="65" valign="top" class="mini">Est.Cost</TH>
<TH width="47" valign="top" class="mini">AO Review</TH>
<TH width="47" valign="top" class="mini">Fiscal Review</TH>
<TH width="65" valign="top" class="mini">Director</TH>
</TR>
<CFOUTPUT query="get_list2">
<TR>
<TD valign="top" class="mini" align="center">
<A HREF="viewRequests.cfm?option=2&huh=1&recordID=#recordID#" target="_blank" class="mini">#recordID#</A>
</TD>
<TD valign="top" class="mini">
<CFSET myVar = mid(rName,1,15)>
#myVar#
</TD>
<TD valign="top" class="mini">
<CFSET myVar1 = mid(Service,1,10)>
#myVar1#
</TD>
<TD valign="top" class="mini" align="center">#FCPGPF#</TD>
<TD valign="top" class="mini">
<CFSET myVar2 = mid(fbPurpose,1,15)>
#myVar2#
</TD>
<TD valign="top" class="mini">
<CFSET myVar3 = mid(activity,1,10)>
#myVar3#</TD>
<TD valign="top" class="mini" align="center">$#Decimalformat(amount)#</TD>
<TD valign="top" class="mini">
<CFIF #aTrigger# EQ "1">
#DateFormat(aDate , "mm/dd/yy")#
<CFELSEIF #aTrigger# EQ "2">
Disapproved
<CFELSEIF #aTrigger# EQ "0">
Pending
</CFIF>
</TD>
<TD valign="top" class="mini">
<CFIF #fTrigger# EQ "1">
#DateFormat(fDate , "mm/dd/yy")#
<CFELSEIF #fTrigger# EQ "2">
Disapproved
<CFELSEIF #aTrigger# EQ "2" AND  #fTrigger# EQ "0">
&nbsp;
<CFELSE>
Pending
</CFIF>
</TD>
<TD valign="top" class="mini">
<CFIF #dTrigger# EQ "1">
Approved
<CFELSEIF #dTrigger# EQ "2">
Disapproved
<CFELSEIF #aTrigger# EQ "2" OR #fTrigger# EQ "2" AND  #dTrigger# EQ "0">
&nbsp;
<CFELSE>
Pending
</CFIF>
</TD>
</TR>
</CFOUTPUT>
</TABLE>
	</CFIF>
</CFIF>
</TD>
</TR>
<TR>
<TD COLSPAN="3">
<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
<!--- Date Last Modified --->
<P>Application Reviewed/ Updated: July 15, 2009</P>
</TD>
</TR>
</TABLE>