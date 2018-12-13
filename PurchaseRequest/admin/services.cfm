<cfquery name="get_services" datasource="FiscalPurchase">
SELECT *
FROM services
WHERE (service <> ' Select >>')
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
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<br>Purchases Using a Government<br>Purchase Card</H3>
	<H5>Manage Service List</H5>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A><br><br>
<a href="index.cfm" CLASS="mini" TITLE="Back">BACK</a></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">
<a href="#add">Add a New Service Listing</a>
<TABLE width="100%" border="0" cellpadding="2" cellspacing="0">
<TR>
<TH>Service</TH>
<TH> </TH>
<TH>DELETE<br />
cannot be undone</TH>
</TR>
<CFOUTPUT query="get_services">
<TR>
<TD valign="top">
<cfform action="processServices.cfm?option=1" method="post">
<cfinput type="text" name="service" value="#service#" class="textc" size="50"></TD>
<TD valign="top">
<input name="recordID" type="hidden" value="#recordID#">
<input name="s1" type="submit" class="textb" value="Update Record"></TD>
</cfform>
<TD align="center" valign="top">
<A href="processServices.cfm?option=2&recordID=#recordID#" onClick="return confirm('Delete CANNOT be undone. Click OK to Delete this entry (Staff: #service#).')"><strong>DELETE</strong></A>
</TD>
</TR>
</CFOUTPUT>
</TABLE>

<a name="add"></a>
<h1>Add a New Service Listing</h1>
<cfform action="processServices.cfm?option=3" method="post">
<TABLE>
<TR>
<TD>Service:</TD>
<TD>
<cfinput type="text" name="service" message="Service Title is Required" required="yes" class="textc" size="50">
</TD>
</TR>
<TR>
<TD COLSPAN="2" ALIGN="center"><br />
<input name="s1" type="submit" class="textb" value="Add Service">
</TD>
</TR>
</TABLE>
</cfform>
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

