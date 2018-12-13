<!--- create date --->
<CFSET myDate=Now()>
<CFSET aDate=#DateFormat(myDate , "mm/dd/yyyy")#>

<!--- update record --->
<cfquery name="post_Offical" datasource="FiscalPurchase">
UPDATE singlePurchase
SET title='#FORM.title#',
	adate='#aDate#',
	aTrigger=#FORM.aTrigger#,
	aComment='#FORM.aComment#',
	aUser='#SESSION.luser#'
WHERE recordID=#FORM.recordID#;	
</cfquery>


<!--- get requester --->
<cfquery name="get_data" datasource="FiscalPurchase">
SELECT recordID, rEmail, aEmail, title, aComment
FROM singlePurchase
WHERE recordID=#FORM.recordID#
</cfquery>

<!--- send disapproval notification to requester --->
<cfif #FORM.aTrigger# EQ "2">

<cfmail to="#rEmail#" from="#aEmail#" subject="F&B Request Disapproved by Authorizing Official - #FORM.recordID#" type="html" query="get_data">
<p>Your request, #FORM.recordID#, has been disapproved by #title#.</p>
<p>Comment: #aComment#</p>
<p><a href="https://vaww.eslse.cf.va.gov/BAY/Fiscal/PurchaseRequest/viewRequests.cfm?option=1&HUH=1&recordID=#recordID#" title="click here to view">Please click here to view</a></p>    
</cfmail>
</cfif>

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
   	<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
</HEAD>

<TABLE WIDTH="650" ALIGN="center">
<TR>
<TD WIDTH="25%" VALIGN="top">
<IMG SRC="sidelogo.gif" ALT="BLDG 20 Bell Tower with two palms" WIDTH="108" HEIGHT="136" BORDER="0">
</TD>
<TD ALIGN="center" WIDTH="50%">
	<H3>Bay Pines VA Healthcare System<BR>Purchase Card <br />Food & Beverage Approval</H3>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">
<CFIF FORM.aTrigger EQ "1">
<h1 align="center">Your approval of <cfoutput>#FORM.recordID#</cfoutput> has been noted and will be processed soon.</h1>
</CFIF>

<CFIF FORM.aTrigger EQ "2">
<h1 align="center">Your disapproval of <cfoutput>#FORM.recordID#</cfoutput> has been noted.  The requestor has been sent a denial notification.</h1>
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

