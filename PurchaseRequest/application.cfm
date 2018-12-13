<!--- Create the application --->
<cfapplication name="Purchase" clientmanagement="Yes"
                    sessionmanagement="Yes"
                    sessiontimeout="#CreateTimeSpan(0,1,0,0)#"
                    applicationtimeout="#CreateTimeSpan(1,0,0,0)#">
					
<!--- create session.luser variable --->
<cfset SESSION.lUser = #getAuthUser()#>

<!--- get/set Approvers --->
<!--- director --->
<cfquery name="get_director" datasource="FiscalPurchase" cachedwithin="#CreateTimeSpan(1,0,0,0)#">
SELECT staff
FROM staff
WHERE User = 1
</cfquery>
<CFSET SESSION.director = #get_director.staff#>
<!--- fiscal --->
<cfquery name="get_fiscal" datasource="FiscalPurchase" cachedwithin="#CreateTimeSpan(1,0,0,0)#">
SELECT staff
FROM staff
WHERE User = 2
</cfquery>
<CFSET SESSION.fiscal = #get_fiscal.staff#>					






