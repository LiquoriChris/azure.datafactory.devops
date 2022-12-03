
# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Updates entity in users
.Description
Updates entity in users
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

APPROLEASSIGNMENT <IMicrosoftGraphAppRoleAssignmentAutoGenerated2[]>: Represents the app roles a user has been granted for an application. Supports $expand.
  [DeletedDateTime <DateTime?>]: 
  [Id <String>]: Read-only.
  [AppRoleId <String>]: The identifier (id) for the app role which is assigned to the principal. This app role must be exposed in the appRoles property on the resource application's service principal (resourceId). If the resource application has not declared any app roles, a default app role ID of 00000000-0000-0000-0000-000000000000 can be specified to signal that the principal is assigned to the resource app without any specific app roles. Required on create.
  [CreatedDateTime <DateTime?>]: The time when the app role assignment was created.The Timestamp type represents date and time information using ISO 8601 format and is always in UTC time. For example, midnight UTC on Jan 1, 2014 is 2014-01-01T00:00:00Z. Read-only.
  [PrincipalDisplayName <String>]: The display name of the user, group, or service principal that was granted the app role assignment. Read-only. Supports $filter (eq and startswith).
  [PrincipalId <String>]: The unique identifier (id) for the user, group or service principal being granted the app role. Required on create.
  [PrincipalType <String>]: The type of the assigned principal. This can either be User, Group or ServicePrincipal. Read-only.
  [ResourceDisplayName <String>]: The display name of the resource app's service principal to which the assignment is made.
  [ResourceId <String>]: The unique identifier (id) for the resource service principal for which the assignment is made. Required on create. Supports $filter (eq only).

IDENTITY <IMicrosoftGraphObjectIdentity[]>: Represents the identities that can be used to sign in to this user account. An identity can be provided by Microsoft (also known as a local account), by organizations, or by social identity providers such as Facebook, Google, and Microsoft, and tied to a user account. May contain multiple items with the same signInType value. Supports $filter (eq) only where the signInType is not userPrincipalName.
  [Issuer <String>]: Specifies the issuer of the identity, for example facebook.com.For local accounts (where signInType is not federated), this property is the local B2C tenant default domain name, for example contoso.onmicrosoft.com.For external users from other Azure AD organization, this will be the domain of the federated organization, for example contoso.com.Supports $filter. 512 character limit.
  [IssuerAssignedId <String>]: Specifies the unique identifier assigned to the user by the issuer. The combination of issuer and issuerAssignedId must be unique within the organization. Represents the sign-in name for the user, when signInType is set to emailAddress or userName (also known as local accounts).When signInType is set to: emailAddress, (or a custom string that starts with emailAddress like emailAddress1) issuerAssignedId must be a valid email addressuserName, issuerAssignedId must be a valid local part of an email addressSupports $filter. 100 character limit.
  [SignInType <String>]: Specifies the user sign-in types in your directory, such as emailAddress, userName or federated. Here, federated represents a unique identifier for a user from an issuer, that can be in any format chosen by the issuer. Additional validation is enforced on issuerAssignedId when the sign-in type is set to emailAddress or userName. This property can also be set to any custom string.

PASSWORDPROFILE <IMicrosoftGraphPasswordProfile>: passwordProfile
  [(Any) <Object>]: This indicates any property can be added to this object.
  [ForceChangePasswordNextSignIn <Boolean?>]: true if the user must change her password on the next login; otherwise false. If not set, default is false. NOTE:  For Azure B2C tenants, set to false and instead use custom policies and user flows to force password reset at first sign in. See Force password reset at first logon.
  [ForceChangePasswordNextSignInWithMfa <Boolean?>]: If true, at next sign-in, the user must perform a multi-factor authentication (MFA) before being forced to change their password. The behavior is identical to forceChangePasswordNextSignIn except that the user is required to first perform a multi-factor authentication before password change. After a password change, this property will be automatically reset to false. If not set, default is false.
  [Password <String>]: The password for the user. This property is required when a user is created. It can be updated, but the user will be required to change the password on the next login. The password must satisfy minimum requirements as specified by the user’s passwordPolicies property. By default, a strong password is required.
.Link
https://docs.microsoft.com/powershell/module/az.resources/update-azaduser
#>
function Update-AzADUser {
    [OutputType([System.Boolean])]
    [CmdletBinding(DefaultParameterSetName='UPNOrObjectIdParameterSet', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    [Alias('Set-AzADUser')]
    param(
        [Parameter(ParameterSetName='UPNOrObjectIdParameterSet', Mandatory)]
        [System.String]
        # The user principal name or object id of the user to be updated.
        ${UPNOrObjectId},
        
        [Parameter(ParameterSetName='ObjectIdParameterSet', Mandatory)]
        [System.String]
        # The user principal name of the user to be updated.
        ${ObjectId},
        
        [Parameter(ParameterSetName = 'InputObjectParameterSet', Mandatory, ValueFromPipeline)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphUser]
        # user input object
        ${InputObject},

        [Parameter()]
        [System.Boolean]
        [Alias('EnableAccount')]
        # true for enabling the account; otherwise, false.
        ${AccountEnabled},
        
        [Parameter()]
        [SecureString]
        # Password for the user. It must meet the tenant's password complexity requirements. It is recommended to set a strong password.
        ${Password},

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        # It must be specified if the user must change the password on the next successful login (true). Default behavior is (false) to not change the password on the next successful login.
        ${ForceChangePasswordNextLogin},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Sets the age group of the user.
        # Allowed values: null, minor, notAdult and adult.
        # Refer to the legal age group property definitions for further information.
        # Supports $filter (eq, ne, NOT, and in).
        ${AgeGroup},
        
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The city in which the user is located.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${City},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The company name which the user is associated.
        # This property can be useful for describing the company that an external user comes from.
        # The maximum length of the company name is 64 characters.Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${CompanyName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Sets whether consent has been obtained for minors.
        # Allowed values: null, granted, denied and notRequired.
        # Refer to the legal age group property definitions for further information.
        # Supports $filter (eq, ne, NOT, and in).
        ${ConsentProvidedForMinor},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The country/region in which the user is located; for example, US or UK.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${Country},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.DateTime]
        # .
        ${DeletedDateTime},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The name for the department in which the user works.
        # Maximum length is 64 characters.Supports $filter (eq, ne, NOT , ge, le, and in operators).
        ${Department},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The name displayed in the address book for the user.
        # This value is usually the combination of the user's first name, middle initial, and last name.
        # This property is required when a user is created and it cannot be cleared during updates.
        # Maximum length is 256 characters.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith), $orderBy, and $search.
        ${DisplayName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.DateTime]
        # The date and time when the user was hired or will start work in case of a future hire.
        # Supports $filter (eq, ne, NOT , ge, le, in).
        ${EmployeeHireDate},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The employee identifier assigned to the user by the organization.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${EmployeeId},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Captures enterprise worker type.
        # For example, Employee, Contractor, Consultant, or Vendor.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${EmployeeType},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # For an external user invited to the tenant using the invitation API, this property represents the invited user's invitation status.
        # For invited users, the state can be PendingAcceptance or Accepted, or null for all other users.
        # Supports $filter (eq, ne, NOT , in).
        ${ExternalUserState},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.DateTime]
        # Shows the timestamp for the latest change to the externalUserState property.
        # Supports $filter (eq, ne, NOT , in).
        ${ExternalUserStateChangeDateTime},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The fax number of the user.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${FaxNumber},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The given name (first name) of the user.
        # Maximum length is 64 characters.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${GivenName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Read-only.
        ${Id},
    
        [Parameter()]
        [AllowEmptyCollection()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphObjectIdentity[]]
        # Represents the identities that can be used to sign in to this user account.
        # An identity can be provided by Microsoft (also known as a local account), by organizations, or by social identity providers such as Facebook, Google, and Microsoft, and tied to a user account.
        # May contain multiple items with the same signInType value.
        # Supports $filter (eq) only where the signInType is not userPrincipalName.
        # To construct, see NOTES section for IDENTITY properties and create a hash table.
        ${Identity},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # Do not use – reserved for future use.
        ${IsResourceAccount},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The user's job title.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${JobTitle},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The SMTP address for the user, for example, admin@contoso.com.
        # Changes to this property will also update the user's proxyAddresses collection to include the value as an SMTP address.
        # While this property can contain accent characters, using them can cause access issues with other Microsoft applications for the user.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith, endsWith).
        ${Mail},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The mail alias for the user.
        # This property must be specified when a user is created.
        # Maximum length is 64 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${MailNickname},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The office location in the user's place of business.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${OfficeLocation},

        [Parameter()]
        [System.String]
        # This property is used to associate an on-premises Active Directory user account to their Azure AD user object.
        # This property must be specified when creating a new user account in the Graph if you are using a federated domain for the user's userPrincipalName (UPN) property.
        # NOTE: The $ and _ characters cannot be used when specifying this property.
        # Returned only on $select.
        # Supports $filter (eq, ne, NOT, ge, le, in)..
        ${OnPremisesImmutableId},
    
        [Parameter()]
        [AllowEmptyCollection()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String[]]
        # A list of additional email addresses for the user; for example: ['bob@contoso.com', 'Robert@fabrikam.com'].NOTE: While this property can contain accent characters, they can cause access issues to first-party applications for the user.Supports $filter (eq, NOT, ge, le, in, startsWith).
        ${OtherMail},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Specifies password policies for the user.
        # This value is an enumeration with one possible value being DisableStrongPassword, which allows weaker passwords than the default policy to be specified.
        # DisablePasswordExpiration can also be specified.
        # The two may be specified together; for example: DisablePasswordExpiration, DisableStrongPassword.Supports $filter (ne, NOT).
        ${PasswordPolicy},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphPasswordProfile]
        # passwordProfile
        # To construct, see NOTES section for PASSWORDPROFILE properties and create a hash table.
        ${PasswordProfile},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The postal code for the user's postal address.
        # The postal code is specific to the user's country/region.
        # In the United States of America, this attribute contains the ZIP code.
        # Maximum length is 40 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${PostalCode},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The preferred language for the user.
        # Should follow ISO 639-1 Code; for example en-US.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${PreferredLanguage},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # true if the Outlook global address list should contain this user, otherwise false.
        # If not set, this will be treated as true.
        # For users invited through the invitation manager, this property will be set to false.
        # Supports $filter (eq, ne, NOT, in).
        ${ShowInAddressList},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The state or province in the user's address.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${State},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The street address of the user's place of business.
        # Maximum length is 1024 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${StreetAddress},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The user's surname (family name or last name).
        # Maximum length is 64 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${Surname},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # A two letter country code (ISO standard 3166).
        # Required for users that will be assigned licenses due to legal requirement to check for availability of services in countries.
        # Examples include: US, JP, and GB.
        # Not nullable.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${UsageLocation},
    
        [Parameter(ParameterSetName='UPNParameterSet', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        [Alias("UPN")]
        # The user principal name (UPN) of the user.
        # The UPN is an Internet-style login name for the user based on the Internet standard RFC 822.
        # By convention, this should map to the user's email name.
        # The general format is alias@domain, where domain must be present in the tenant's collection of verified domains.
        # This property is required when a user is created.
        # The verified domains for the tenant can be accessed from the verifiedDomains property of organization.NOTE: While this property can contain accent characters, they can cause access issues to first-party applications for the user.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith, endsWith) and $orderBy.
        ${UserPrincipalName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # A string value that can be used to classify user types in your directory, such as Member and Guest.
        # Supports $filter (eq, ne, NOT, in,).
        ${UserType},
    
        [Parameter()]
        [Alias("AzContext", "AzureRmContext", "AzureCredential")]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Returns true when the command succeeds
        ${PassThru},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )
    
    process {
            switch ($PSCmdlet.ParameterSetName) {
            'ObjectIdParameterSet' {
                $id = $PSBoundParameters['ObjectId']
                $null = $PSBoundParameters.Remove('ObjectId')
                break
            }
            'InputObjectParameterSet' {
                $id = $PSBoundParameters['InputObject'].Id
                $null = $PSBoundParameters.Remove('InputObject')
                break
            }
            'UPNOrObjectIdParameterSet' {
                $id = $PSBoundParameters['UPNOrObjectId']
                $null = $PSBoundParameters.Remove('UPNOrObjectId')
                break
            }
            'UPNParameterSet' {
              $id = $PSBoundParameters['UserPrincipalName']
              $null = $PSBoundParameters.Remove('UserPrincipalName')
              break
          }
      }
      if ($PSBoundParameters.ContainsKey('Password')) {
        $passwordProfile = [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.MicrosoftGraphPasswordProfile]::New()
        $passwordProfile.ForceChangePasswordNextSignIn = $ForceChangePasswordNextLogin
        $passwordProfile.Password = . "$PSScriptRoot/../utils/Unprotect-SecureString.ps1" $PSBoundParameters['Password']
        $null = $PSBoundParameters.Remove('Password')
        $null = $PSBoundParameters.Remove('ForceChangePasswordNextLogin')
        $PSBoundParameters['AccountEnabled'] = $true
        $PSBoundParameters['PasswordProfile'] = $passwordProfile
      }
      $PSBoundParameters['Id'] = $id

      Az.MSGraph.internal\Update-AzADUser @PSBoundParameters
    }
}
    
# SIG # Begin signature block
# MIInqgYJKoZIhvcNAQcCoIInmzCCJ5cCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDw0znhAtY07z+5
# Na2lA12chDpoZWIgbLPy3aD0wNuEGqCCDYEwggX/MIID56ADAgECAhMzAAACzI61
# lqa90clOAAAAAALMMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjIwNTEyMjA0NjAxWhcNMjMwNTExMjA0NjAxWjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQCiTbHs68bADvNud97NzcdP0zh0mRr4VpDv68KobjQFybVAuVgiINf9aG2zQtWK
# No6+2X2Ix65KGcBXuZyEi0oBUAAGnIe5O5q/Y0Ij0WwDyMWaVad2Te4r1Eic3HWH
# UfiiNjF0ETHKg3qa7DCyUqwsR9q5SaXuHlYCwM+m59Nl3jKnYnKLLfzhl13wImV9
# DF8N76ANkRyK6BYoc9I6hHF2MCTQYWbQ4fXgzKhgzj4zeabWgfu+ZJCiFLkogvc0
# RVb0x3DtyxMbl/3e45Eu+sn/x6EVwbJZVvtQYcmdGF1yAYht+JnNmWwAxL8MgHMz
# xEcoY1Q1JtstiY3+u3ulGMvhAgMBAAGjggF+MIIBejAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUiLhHjTKWzIqVIp+sM2rOHH11rfQw
# UAYDVR0RBEkwR6RFMEMxKTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1
# ZXJ0byBSaWNvMRYwFAYDVQQFEw0yMzAwMTIrNDcwNTI5MB8GA1UdIwQYMBaAFEhu
# ZOVQBdOCqhc3NyK1bajKdQKVMFQGA1UdHwRNMEswSaBHoEWGQ2h0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY0NvZFNpZ1BDQTIwMTFfMjAxMS0w
# Ny0wOC5jcmwwYQYIKwYBBQUHAQEEVTBTMFEGCCsGAQUFBzAChkVodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY0NvZFNpZ1BDQTIwMTFfMjAx
# MS0wNy0wOC5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAeA8D
# sOAHS53MTIHYu8bbXrO6yQtRD6JfyMWeXaLu3Nc8PDnFc1efYq/F3MGx/aiwNbcs
# J2MU7BKNWTP5JQVBA2GNIeR3mScXqnOsv1XqXPvZeISDVWLaBQzceItdIwgo6B13
# vxlkkSYMvB0Dr3Yw7/W9U4Wk5K/RDOnIGvmKqKi3AwyxlV1mpefy729FKaWT7edB
# d3I4+hldMY8sdfDPjWRtJzjMjXZs41OUOwtHccPazjjC7KndzvZHx/0VWL8n0NT/
# 404vftnXKifMZkS4p2sB3oK+6kCcsyWsgS/3eYGw1Fe4MOnin1RhgrW1rHPODJTG
# AUOmW4wc3Q6KKr2zve7sMDZe9tfylonPwhk971rX8qGw6LkrGFv31IJeJSe/aUbG
# dUDPkbrABbVvPElgoj5eP3REqx5jdfkQw7tOdWkhn0jDUh2uQen9Atj3RkJyHuR0
# GUsJVMWFJdkIO/gFwzoOGlHNsmxvpANV86/1qgb1oZXdrURpzJp53MsDaBY/pxOc
# J0Cvg6uWs3kQWgKk5aBzvsX95BzdItHTpVMtVPW4q41XEvbFmUP1n6oL5rdNdrTM
# j/HXMRk1KCksax1Vxo3qv+13cCsZAaQNaIAvt5LvkshZkDZIP//0Hnq7NnWeYR3z
# 4oFiw9N2n3bb9baQWuWPswG0Dq9YT9kb+Cs4qIIwggd6MIIFYqADAgECAgphDpDS
# AAAAAAADMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0
# ZSBBdXRob3JpdHkgMjAxMTAeFw0xMTA3MDgyMDU5MDlaFw0yNjA3MDgyMTA5MDla
# MH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMT
# H01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCr8PpyEBwurdhuqoIQTTS68rZYIZ9CGypr6VpQqrgG
# OBoESbp/wwwe3TdrxhLYC/A4wpkGsMg51QEUMULTiQ15ZId+lGAkbK+eSZzpaF7S
# 35tTsgosw6/ZqSuuegmv15ZZymAaBelmdugyUiYSL+erCFDPs0S3XdjELgN1q2jz
# y23zOlyhFvRGuuA4ZKxuZDV4pqBjDy3TQJP4494HDdVceaVJKecNvqATd76UPe/7
# 4ytaEB9NViiienLgEjq3SV7Y7e1DkYPZe7J7hhvZPrGMXeiJT4Qa8qEvWeSQOy2u
# M1jFtz7+MtOzAz2xsq+SOH7SnYAs9U5WkSE1JcM5bmR/U7qcD60ZI4TL9LoDho33
# X/DQUr+MlIe8wCF0JV8YKLbMJyg4JZg5SjbPfLGSrhwjp6lm7GEfauEoSZ1fiOIl
# XdMhSz5SxLVXPyQD8NF6Wy/VI+NwXQ9RRnez+ADhvKwCgl/bwBWzvRvUVUvnOaEP
# 6SNJvBi4RHxF5MHDcnrgcuck379GmcXvwhxX24ON7E1JMKerjt/sW5+v/N2wZuLB
# l4F77dbtS+dJKacTKKanfWeA5opieF+yL4TXV5xcv3coKPHtbcMojyyPQDdPweGF
# RInECUzF1KVDL3SV9274eCBYLBNdYJWaPk8zhNqwiBfenk70lrC8RqBsmNLg1oiM
# CwIDAQABo4IB7TCCAekwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFEhuZOVQ
# BdOCqhc3NyK1bajKdQKVMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1Ud
# DwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFHItOgIxkEO5FAVO
# 4eqnxzHRI4k0MFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwubWljcm9zb2Z0
# LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcmwwXgYIKwYBBQUHAQEEUjBQME4GCCsGAQUFBzAChkJodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcnQwgZ8GA1UdIASBlzCBlDCBkQYJKwYBBAGCNy4DMIGDMD8GCCsGAQUFBwIB
# FjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2RvY3MvcHJpbWFyeWNw
# cy5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcAYQBsAF8AcABvAGwAaQBjAHkA
# XwBzAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZIhvcNAQELBQADggIBAGfyhqWY
# 4FR5Gi7T2HRnIpsLlhHhY5KZQpZ90nkMkMFlXy4sPvjDctFtg/6+P+gKyju/R6mj
# 82nbY78iNaWXXWWEkH2LRlBV2AySfNIaSxzzPEKLUtCw/WvjPgcuKZvmPRul1LUd
# d5Q54ulkyUQ9eHoj8xN9ppB0g430yyYCRirCihC7pKkFDJvtaPpoLpWgKj8qa1hJ
# Yx8JaW5amJbkg/TAj/NGK978O9C9Ne9uJa7lryft0N3zDq+ZKJeYTQ49C/IIidYf
# wzIY4vDFLc5bnrRJOQrGCsLGra7lstnbFYhRRVg4MnEnGn+x9Cf43iw6IGmYslmJ
# aG5vp7d0w0AFBqYBKig+gj8TTWYLwLNN9eGPfxxvFX1Fp3blQCplo8NdUmKGwx1j
# NpeG39rz+PIWoZon4c2ll9DuXWNB41sHnIc+BncG0QaxdR8UvmFhtfDcxhsEvt9B
# xw4o7t5lL+yX9qFcltgA1qFGvVnzl6UJS0gQmYAf0AApxbGbpT9Fdx41xtKiop96
# eiL6SJUfq/tHI4D1nvi/a7dLl+LrdXga7Oo3mXkYS//WsyNodeav+vyL6wuA6mk7
# r/ww7QRMjt/fdW1jkT3RnVZOT7+AVyKheBEyIXrvQQqxP/uozKRdwaGIm1dxVk5I
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIZfzCCGXsCAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAsyOtZamvdHJTgAAAAACzDAN
# BglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgjGb5IyEe
# N87jJ3M6yfgWJGhir3TWL5WFz+pof3HBL7MwQgYKKwYBBAGCNwIBDDE0MDKgFIAS
# AE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTAN
# BgkqhkiG9w0BAQEFAASCAQB+i7QvSvy5po8mjPCOUKq6z3aja0PF0XNC/OJCyW4p
# YiCFwvqqOIh/x2GFjMDmYfgF6fYEhbVIPy70y7Aejha5VaeJJPg8J0rDzeMklgd9
# jMln/RShYJEbjcRaKnTnpqaGvS4bVXPBoUKAOr/CUNfR1K0wkn0vlsiQF4EWHoOG
# WVDx0wgZIGHWBnD/dzBxknmbKEYFiSe1JhSsrJG4EdAuCdPxF0lO20TgcVPIHXli
# pBpsQtJAVnWyvXuNGWVLvjrbNVqD5I0MfkDkiJQGg+KV/S/ArcDbamuHR7KEL20I
# Wn8PhwuIm15Xh333TJMleXiwFhmhY5sWTAcJT2MCKQ7HoYIXCTCCFwUGCisGAQQB
# gjcDAwExghb1MIIW8QYJKoZIhvcNAQcCoIIW4jCCFt4CAQMxDzANBglghkgBZQME
# AgEFADCCAVUGCyqGSIb3DQEJEAEEoIIBRASCAUAwggE8AgEBBgorBgEEAYRZCgMB
# MDEwDQYJYIZIAWUDBAIBBQAEIB3ALPdSzY+4dnEZ4w3dJ9BwpvhBezVqTtgUyNJ/
# n1yHAgZjc5dMDw0YEzIwMjIxMTE3MTMzNzI4LjY3MVowBIACAfSggdSkgdEwgc4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKTAnBgNVBAsTIE1p
# Y3Jvc29mdCBPcGVyYXRpb25zIFB1ZXJ0byBSaWNvMSYwJAYDVQQLEx1UaGFsZXMg
# VFNTIEVTTjpGN0E2LUUyNTEtMTUwQTElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUt
# U3RhbXAgU2VydmljZaCCEVwwggcQMIIE+KADAgECAhMzAAABpQDeCMRAB3FOAAEA
# AAGlMA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEw
# MB4XDTIyMDMwMjE4NTExOVoXDTIzMDUxMTE4NTExOVowgc4xCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVy
# YXRpb25zIFB1ZXJ0byBSaWNvMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjpGN0E2
# LUUyNTEtMTUwQTElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2Vydmlj
# ZTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALqxhuggaki8wuoOMMd7
# rsEQnmAhtV8iU1Y0itsHq30TdCXJDmvZjaZ8yvOHYFVhTyD1b5JGJtwZjWz1fglC
# qsx5qBxP1Wx1CZnsQ1tiRsRWQc12VkETmkY8x46MgHsGyAmhPPpsgRnklGai7HqQ
# FB31x/Qjkx7rbAlr6PblB4tOmaR1nKxl4VIgstDwfneKaoEEw4iN/xTdztZjwyGi
# Y5hNp6beetkcizgJFO3/yRHYh0gtk+bREhrmIgbarrrgbz7MsnA7tlKvGcO9iHc6
# +2symrAVy3CzQ4IMNPFcTTx8wTZ+kpv6lFs1eG8xlfsu2NDWKshrMlKH2JpYzWAW
# 1fCOD5irXsE4LOvixZQvbneQE6+iGfIQwabj+fRdouAU2AiE+iaNsIDapdKab8WL
# xz6VPRbEL+M6MFkcsoiuKHHoshCp7JhmZ9iM0yrEx2XebOha/XQ342KsRGs2h02g
# pX6wByyT8eD3MJVIxSRm4MLIilvWcpd9N3rooawbLU6gdk7goKWS69+w2jtouXCE
# Yt6IPfZq8ldi0L/CwYbtv7mbHmIZ9Oc0JEJc6b9gcVDfoPiemMKcz15BLepyx7np
# Q2MiDKIscOqKhXuZI+PZerNOHhi/vsy2/Fj9lB6kJrMYSfV0F2frvBSBXMB7xjv8
# pgqX5QXUe8nTxb4UfJ0cDAvBAgMBAAGjggE2MIIBMjAdBgNVHQ4EFgQUX6aPAwCX
# rq6tcO773FkXS2ipGt8wHwYDVR0jBBgwFoAUn6cVXQBeYl2D9OXSZacbUzUZ6XIw
# XwYDVR0fBFgwVjBUoFKgUIZOaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9w
# cy9jcmwvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3Js
# MGwGCCsGAQUFBwEBBGAwXjBcBggrBgEFBQcwAoZQaHR0cDovL3d3dy5taWNyb3Nv
# ZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENB
# JTIwMjAxMCgxKS5jcnQwDAYDVR0TAQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcD
# CDANBgkqhkiG9w0BAQsFAAOCAgEAlpsLF+UwMKKER2p0WJno4G6GGGnfg3qjDdaH
# c5uvXYtG6KmHrqAf/YqHkmNotSr6ZEEnlGCJYR7W3uJ+5bpvj03wFqGefvQsKIR2
# +q6TrzozvP4NsodWTT5SVp/C6TEDGuLC9mOQKA4tyL40HTW7txb0cAdfgnyHFoI/
# BsZo/FaXezQ8hO4xUjhDpyNNeJ6WYvX5NC+Hv9nmTyzjqyEg/L2cXAOmxEWvfPAQ
# 1lfxvrtUwG75jGeUaewkhwtzanCnP3l6YjwJFKB6n7/TXtrfik1xY1kgev1JwQ5a
# UdPxwSdDmGE4XTN2s6pPOi8IO199Of6AEvh41eDxRz+11VUcpuGn7tJUeSTUSHsv
# zQ8ECOj5w77Mv55/F8hWu07egnG8SrWj5+TFxNPCpx/AFNvzz+odTRTZd4LWuomc
# MHUmLFiUGOAdetF6SofHG5EcFn0DTD1apBZzCP8xsGQcZgwVqo7ov23/uIJlMCLA
# yTYZV9ITCP09ciUJbKBVCQNrGEnQ/XLFO9mysyyDRrvHhU5uGPdXz4Jt2/ZN7JQY
# RuVNSuCpNwoK0Jr1s6ciDvHEeLyiczxoIe9GH3SyfbHx6v/phI+iE3DWo1TCK75E
# L6pt6k5i36/kn2uSVXdTH44ZVkh3/ihV3vEws78uGlvsiMcrKBgpo3HdcjDHiHoW
# sUf4GIwwggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqGSIb3
# DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIw
# MAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAx
# MDAeFw0yMTA5MzAxODIyMjVaFw0zMDA5MzAxODMyMjVaMHwxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFBDQSAyMDEwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA
# 5OGmTOe0ciELeaLL1yR5vQ7VgtP97pwHB9KpbE51yMo1V/YBf2xK4OK9uT4XYDP/
# XE/HZveVU3Fa4n5KWv64NmeFRiMMtY0Tz3cywBAY6GB9alKDRLemjkZrBxTzxXb1
# hlDcwUTIcVxRMTegCjhuje3XD9gmU3w5YQJ6xKr9cmmvHaus9ja+NSZk2pg7uhp7
# M62AW36MEBydUv626GIl3GoPz130/o5Tz9bshVZN7928jaTjkY+yOSxRnOlwaQ3K
# Ni1wjjHINSi947SHJMPgyY9+tVSP3PoFVZhtaDuaRr3tpK56KTesy+uDRedGbsoy
# 1cCGMFxPLOJiss254o2I5JasAUq7vnGpF1tnYN74kpEeHT39IM9zfUGaRnXNxF80
# 3RKJ1v2lIH1+/NmeRd+2ci/bfV+AutuqfjbsNkz2K26oElHovwUDo9Fzpk03dJQc
# NIIP8BDyt0cY7afomXw/TNuvXsLz1dhzPUNOwTM5TI4CvEJoLhDqhFFG4tG9ahha
# YQFzymeiXtcodgLiMxhy16cg8ML6EgrXY28MyTZki1ugpoMhXV8wdJGUlNi5UPkL
# iWHzNgY1GIRH29wb0f2y1BzFa/ZcUlFdEtsluq9QBXpsxREdcu+N+VLEhReTwDwV
# 2xo3xwgVGD94q0W29R6HXtqPnhZyacaue7e3PmriLq0CAwEAAaOCAd0wggHZMBIG
# CSsGAQQBgjcVAQQFAgMBAAEwIwYJKwYBBAGCNxUCBBYEFCqnUv5kxJq+gpE8RjUp
# zxD/LwTuMB0GA1UdDgQWBBSfpxVdAF5iXYP05dJlpxtTNRnpcjBcBgNVHSAEVTBT
# MFEGDCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wEwYDVR0lBAwwCgYI
# KwYBBQUHAwgwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGG
# MA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb186a
# GMQwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3Br
# aS9jcmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoGCCsG
# AQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraS9jZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwDQYJKoZIhvcN
# AQELBQADggIBAJ1VffwqreEsH2cBMSRb4Z5yS/ypb+pcFLY+TkdkeLEGk5c9MTO1
# OdfCcTY/2mRsfNB1OW27DzHkwo/7bNGhlBgi7ulmZzpTTd2YurYeeNg2LpypglYA
# A7AFvonoaeC6Ce5732pvvinLbtg/SHUB2RjebYIM9W0jVOR4U3UkV7ndn/OOPcbz
# aN9l9qRWqveVtihVJ9AkvUCgvxm2EhIRXT0n4ECWOKz3+SmJw7wXsFSFQrP8DJ6L
# GYnn8AtqgcKBGUIZUnWKNsIdw2FzLixre24/LAl4FOmRsqlb30mjdAy87JGA0j3m
# Sj5mO0+7hvoyGtmW9I/2kQH2zsZ0/fZMcm8Qq3UwxTSwethQ/gpY3UA8x1RtnWN0
# SCyxTkctwRQEcb9k+SS+c23Kjgm9swFXSVRk2XPXfx5bRAGOWhmRaw2fpCjcZxko
# JLo4S5pu+yFUa2pFEUep8beuyOiJXk+d0tBMdrVXVAmxaQFEfnyhYWxz/gq77EFm
# PWn9y8FBSX5+k77L+DvktxW/tM4+pTFRhLy/AsGConsXHRWJjXD+57XQKBqJC482
# 2rpM+Zv/Cuk0+CQ1ZyvgDbjmjJnW4SLq8CdCPSWU5nR0W2rRnj7tfqAxM328y+l7
# vzhwRNGQ8cirOoo6CGJ/2XBjU02N7oJtpQUQwXEGahC0HVUzWLOhcGbyoYICzzCC
# AjgCAQEwgfyhgdSkgdEwgc4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xKTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1ZXJ0byBSaWNv
# MSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjpGN0E2LUUyNTEtMTUwQTElMCMGA1UE
# AxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUA
# s8lw20WzmxDKiN1Lhh7mZWXutKiggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEG
# A1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
# cm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFt
# cCBQQ0EgMjAxMDANBgkqhkiG9w0BAQUFAAIFAOcgD/IwIhgPMjAyMjExMTcwNTQy
# MTBaGA8yMDIyMTExODA1NDIxMFowdDA6BgorBgEEAYRZCgQBMSwwKjAKAgUA5yAP
# 8gIBADAHAgEAAgIhzTAHAgEAAgIRtjAKAgUA5yFhcgIBADA2BgorBgEEAYRZCgQC
# MSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqG
# SIb3DQEBBQUAA4GBAE2nU6fjFD51dxB4pk45JTugc07VWCvhQq9OMVkEOwixvDlt
# fDltniev9ll8QTUEfn4P31G52g8zIAceZOENtPBLepxH6JMV8rsjukP4PciENOEu
# XSihwD78JOIGi4HXiodoPiUZpYmM8Zqln3ina8JK+XK242NaM6uP5xsMwwIDMYIE
# DTCCBAkCAQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAGl
# AN4IxEAHcU4AAQAAAaUwDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzEN
# BgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgw/g4Hs5dPb1HxngjHpDbIhtf
# lt6lzyTqeD2UvmdLqt8wgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCC4Cjhx
# fmYEsaCt2AU83Khh+6JHlyk3B70vfMHMlBLcXDCBmDCBgKR+MHwxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFBDQSAyMDEwAhMzAAABpQDeCMRAB3FOAAEAAAGlMCIEIJP+o5Qr
# XrMEDF/shsd74Qr7kNS5Q6QOSBbcHW4bjlg+MA0GCSqGSIb3DQEBCwUABIICAHZ4
# ftqpb2y4x3A2SXVydpVkC9Yn2tPXEnw3PBws1hCOzDTCme7nmcojWwbvhKn7I6ip
# hJCvWgUEaRGQU0hYKox7OtsmmFa77UYaRKo9uYfpeLr3fbkX8XB86B92gxOcjEe4
# lEMt52yALhbvbljZ2h00/iyhAa+Y6tf/lsz3mnkVzoCzri3rRrom0ULASYU7V5ko
# Sk9jRp/xUieB/34U+kw/mE37mtwXkkNYewMjph5pQsZH0hytOtiU2c/RgWAqBWcq
# EEXmJUIrvV6PmWtyycmL6ML8ZXeZ9DVY9fH0n525TvT6iRD4fxqlFQ0KI2MwRzD/
# 8U4f/F9lsUvsMh816v8VA/Pbc2nBUXr49IOvhb32uC8S3DnuGCgUxUB13LeJTvJ3
# GIlvAy+WZLpBFMfcpyrZiTE1PxwBEsJXuu/Xq8wYvxQJj4UvMf2bfkRp80v0p0P+
# SIsJBhYZjRgB4h7hAOcEnDt9ZaBMspLoGtRrY6exEL9LG5SVnLstsXTqYTdrQwzV
# vsFQ+ZfXBUQI/brH0TzuJo4f80d5RhO/wXVz2XxGDas6Hipc8Q+LN0G2j12w2u4U
# epbS6uUjhtLm3Wfp5JUYPxd7+ahVzJODes9dGkANdS/zns9s/SoMUxgip7OIYfGm
# pBXV+vFXsSk+u4RK8Nht9/cCijgtHvWiqXBJX2pM
# SIG # End signature block
