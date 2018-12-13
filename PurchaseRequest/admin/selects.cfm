<!--- activity select listing --->
<cfquery name="get_activity" datasource="FiscalPurchase">
SELECT *
FROM activities
WHERE (parties <> ' Select >>')
</cfquery>

<!--- type select listing --->
<cfquery name="get_type" datasource="FiscalPurchase">
SELECT *
FROM types
WHERE (type <> ' Select >>')
</cfquery>

<!--- clerk select listing --->
<cfquery name="get_clerk" datasource="FiscalPurchase">
SELECT *
FROM clerks
WHERE (clerk <> ' Select >>')
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
	<H5>Manage Form Select Lists</H5>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A><br><br>
<a href="index.cfm" CLASS="mini" TITLE="Back">BACK</a></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">

<!--- activity --->
<h1>Who is the activity for?</h1>
<TABLE width="100%" border="0" cellpadding="2" cellspacing="0">
<TR>
<TH>Activity</TH>
<TH> </TH>
<TH>DELETE<br />
cannot be undone</TH>
</TR>
<CFOUTPUT query="get_activity">
<TR>
<TD valign="top">
<cfform action="processSelects.cfm?option=1" method="post" name="1">
<cfinput type="text" name="parties" value="#parties#" class="textc" size="50"></TD>
<TD valign="top">
<input name="recordID" type="hidden" value="#recordID#">
<input name="s1" type="submit" class="textb" value="Update Record"></TD>
</cfform>
<TD align="center" valign="top">
<A href="processSelects.cfm?option=12&recordID=#recordID#" onClick="return confirm('Delete CANNOT be undone. Click OK to Delete this entry (Staff: #parties#).')"><strong>DELETE</strong></A>
</TD>
</TR>
</CFOUTPUT>
</TABLE>

<a name="add1"></a>
<h1>Add an Activity Listing</h1>
<cfform action="processSelects.cfm?option=13" method="post" name="2">
<TABLE>
<TR>
<TD>Activity:</TD>
<TD>
<cfinput type="text" name="parties" message="Activity is Required" required="yes" class="textc" size="50">
</TD>
</TR>
<TR>
<TD COLSPAN="2" ALIGN="center"><br />
<input name="s1" type="submit" class="textb" value="Add Activity">
</TD>
</TR>
</TABLE>
</cfform>
<HR width="75%" size="1">

<!--- type of request --->
<h1>Type of Request</h1>
<TABLE width="100%" border="0" cellpadding="2" cellspacing="0">
<TR>
<TH>Type of Request</TH>
<TH> </TH>
<TH>DELETE<br />
cannot be undone</TH>
</TR>
<CFOUTPUT query="get_type">
<TR>
<TD valign="top">
<cfform action="processSelects.cfm?option=2" method="post" name="3">
<cfinput type="text" name="type" value="#type#" class="textc" size="50"></TD>
<TD valign="top">
<input name="recordID" type="hidden" value="#recordID#">
<input name="s1" type="submit" class="textb" value="Update Record"></TD>
</cfform>
<TD align="center" valign="top">
<A href="processSelects.cfm?option=22&recordID=#recordID#" onClick="return confirm('Delete CANNOT be undone. Click OK to Delete this entry (Staff: #type#).')"><strong>DELETE</strong></A>
</TD>
</TR>
</CFOUTPUT>
</TABLE>

<a name="add2"></a>
<h1>Add a New Type of Request</h1>
<cfform action="processSelects.cfm?option=23" method="post" name="4">
<TABLE>
<TR>
<TD>Service:</TD>
<TD>
<cfinput type="text" name="type" message="Type of Request is Required" required="yes" class="textc" size="50">
</TD>
</TR>
<TR>
<TD COLSPAN="2" ALIGN="center"><br />
<input name="s1" type="submit" class="textb" value="Add Type of Request">
</TD>
</TR>
</TABLE>
</cfform>
<HR width="75%" size="1">

<!--- clerk --->
<h1>If approved, order will be placed on a GPC by:</h1>
<TABLE width="100%" border="0" cellpadding="2" cellspacing="0">
<TR>
<TH>Clerk</TH>
<TH> </TH>
<TH>DELETE<br />
cannot be undone</TH>
</TR>
<CFOUTPUT query="get_clerk">
<TR>
<TD valign="top">
<cfform action="processSelects.cfm?option=3" method="post" name="5">
<cfinput type="text" name="clerk" value="#clerk#" class="textc" size="50"></TD>
<TD valign="top">
<input name="recordID" type="hidden" value="#recordID#">
<input name="s1" type="submit" class="textb" value="Update Record"></TD>
</cfform>
<TD align="center" valign="top">
<A href="processSelects.cfm?option=32&recordID=#recordID#" onClick="return confirm('Delete CANNOT be undone. Click OK to Delete this entry (Staff: #clerk#).')"><strong>DELETE</strong></A>
</TD>
</TR>
</CFOUTPUT>
</TABLE>

<a name="add3"></a>
<h1>Add a New Clerk Listing</h1>
<cfform action="processSelects.cfm?option=33" method="post" name="6">
<TABLE>
<TR>
<TD>Clerk:</TD>
<TD>
<cfinput type="text" name="clerk" message="Clerk is Required" required="yes" class="textc" size="50">
</TD>
</TR>
<TR>
<TD COLSPAN="2" ALIGN="center"><br />
<input name="s1" type="submit" class="textb" value="Add Clerk">
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

