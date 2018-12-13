<!--- Get all records from the database that match this users credentials --->
<cfquery name="checkIn" datasource="FiscalPurchase">
SELECT		recordID, *
FROM		Staff
WHERE		recordID = #form.id#
</cfquery>


<cfif checkIn.RecordCount EQ "1">
    <!--- This user has logged in correctly, change the value of the session.allowin value --->
    <cfset session.allowin = "True">
	<cfset session.user = "#checkin.recordID#">
    <!--- Now redirect to the appropriate index --->
    <script>
         self.location="admin/index.cfm";
    </script>
<cfelse>
    <!--- this user did not log in correctly, alert and redirect to the login page --->
    <script>
        alert("Your credentials could not be verified, please try again!!!");
        self.location="Javascript:history.go(-1)";
    </script>
</cfif>




<!--- Get all records from the database that match this users credentials
<cfquery name="checkIn" datasource="FiscalPurchase">
SELECT		recordID, Password, email, user
FROM		staff
WHERE		email = '#form.email#'
AND			Password = '#form.password#'
</cfquery>

<!--- first time in the system --->
<CFIF #checkin.password# EQ "password">
<cflocation url="newpassword.cfm?recordID=#checkin.recordID#" addtoken="yes">

<CFELSE>
<cfif checkIn.RecordCount>
    <!--- This user has logged in correctly, change the value of the session.allowin value --->
    <cfset session.allowin = "True">
	<cfset session.user = "#checkin.recordID#">
    <!--- Now redirect to the appropriate index --->
    <script>
		 <CFIF #checkin.user# EQ "3">
         self.location="admin/index.cfm";
		 <CFELSE>
		 self.location="index.cfm";
		 </CFIF>
    </script>
<cfelse>
    <!--- this user did not log in correctly, alert and redirect to the login page --->
    <script>
        alert("Your credentials could not be verified, please try again!!!");
        self.location="Javascript:history.go(-1)";
    </script>
</cfif>
</CFIF> --->