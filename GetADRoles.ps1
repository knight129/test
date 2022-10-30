#Connect-AzAccount

Set-AzContext -Subscription "Azure Hub"

$storageAccounts = Get-AzRoleAssignment -ObjectId fbd76eb4-51b4-4f6f-b0e6-9e078aac848a

        
  [System.Collections.ArrayList]$saUsage = New-Object -TypeName System.Collections.ArrayList
        
   foreach ($storageAccount in $storageAccounts) {
        
        
              $StorageAccountDetails = [ordered]@{
                      
                      Scope = $storageAccount.Scope
					  Display_Name = $storageAccount.DisplayName
					  RoleDefinitionName = $storageAccount.RoleDefinitionName
					   
                         
                }
               $saUsage.add((New-Object psobject -Property $StorageAccountDetails))  | Out-Null   
  }
  $saUsage | Export-Csv -Path C:\Users\rakes\newtestdisk.csv -NoClobber -NoTypeInformation -Append -Encoding UTF8 -Force
