<!--- FROM \login.cfm --->
<!--- get select, services--->
<cfquery name="get_services" datasource="FiscalPurchase">
SELECT service
FROM services
ORDER BY service
</cfquery>


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
	<META NAME="DateReviewed" CONTENT="20170502">
	<META NAME="Language" CONTENT="en">
	<META NAME="Type" CONTENT="Interactive Resource">
   	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</HEAD>
<body>
<CFIF IsDefined('session.access')>
<TABLE WIDTH="650" ALIGN="center">
<TR>
<TD WIDTH="25%" VALIGN="top">
<IMG SRC="../sidelogo.gif" ALT="BLDG 20 Bell Tower with two palms" WIDTH="108" HEIGHT="136" BORDER="0">
</TD>
<TD ALIGN="center" WIDTH="50%">
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<br>Purchases Using a Government<br>Purchase Card</H3>
	<H5>RESTRICTED ACCESS</H5>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
	</TD>
</TR>

<TR>
<TD COLSPAN="3">
<!--- admins only --->
<CFIF session.access EQ "3">
<DIV ALIGN="center">
<span style="background-color:#FFFF00; font-weight:bold">&nbsp;&nbsp;CAUTION&nbsp;&nbsp;<br>
Approvers and Administrators are the same for Single/Blanket Purchase Card<br>and Gift Card Requests</span>
</DIV>
<h1>Manage</h1>
<UL>
<LI><a href="services.cfm">Service List</a></LI>
<LI><a href="selects.cfm">Form Select Lists</a></LI>
<LI><a href="approvers.cfm">Approvers</a> *</LI>
<LI><a href="users.cfm">Restricted Access</a> *</LI>
</UL>
* <a title="Notes" onclick="window.open('https://vaww.eslse.cf.va.gov/BAY/FISCAL/PurchaseRequest/admin/notes.htm','POC','scrollbars=yes,width=600,height=400,left=200,top=200');return false;" href="https://vaww.eslse.cf.va.gov/BAY/FISCAL/PurchaseRequest/admin/notes.htm">Notes regarding staff records</a>
</CFIF>
<!--- end admins only --->
<h1>Reports</h1>
<cfform action="reports.cfm" method="post" name="reports">
<TABLE BORDER="0" ALIGN="center">
<TR>
<TD COLSPAN="4">
<cfinput type="radio" name="reportType" value="1">All Submissions
<cfinput type="radio" name="reportType" checked="true" value="2">Approved
<TR>
<TD class="mini" VALIGN="top"><strong>From:</strong></TD>
<TD>
 <cf_datepicker textboxname="BDate"
                          formname="reports"
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
<TD class="mini" VALIGN="top"><strong>To:</strong></TD>
<TD><cf_datepicker textboxname="EDate"
                          formname="reports"
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
                          displayorientation="right"></TD>
</TR>
<TR>
<TD class="mini" VALIGN="top" colspan="4">
<cfinput type="radio" name="collate" checked="true" value="1"> All
<cfinput type="radio" name="collate" value="2"> By Service:
<cfselect name="service" multiple="no" query="get_services" value="service" display="service" class="textb"></cfselect>
<input name="s1" type="submit" value="Build Report" class="textb">
</TD>
</TR>
</TABLE>
</cfform>
<LI><a href="report_PLO.cfm">P&LO Report</a>
<LI><A href="reportPending.cfm" title="Requests in Process">Requests in Process</A>
</TD>
</TR>
<TR>
<TD COLSPAN="3">
<DIV ALIGN="right">
<A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
<!--- Date Last Modified --->
<P>Application Reviewed/ Updated: May 2, 2017</P>
</TD>
</TR>
</TABLE>
<CFELSE>
<cflocation url="../login.cfm" addtoken="no">
</CFIF>