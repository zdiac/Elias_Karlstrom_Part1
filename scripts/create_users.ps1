# Import the AD module to make user management commands available
Import-Module ActiveDirectory

# Read all rows from the CSV file into the variable $users
$users = Import-Csv -Path "C:\lab\data\users.csv" -Encoding UTF8

foreach ($user in $users) {

    # Skip if an account with the same username already exists
    if (Get-ADUser -Filter "SamAccountName -eq '$($user.Username)'" -ErrorAction SilentlyContinue) {
        Write-Host "SKIPPED: $($user.Username) already exists" -ForegroundColor Yellow
        continue
    }

    # Build the OU path based on the Department column
    $ouPath = "OU=$($user.Department),OU=IT-Department,DC=bjorklunda,DC=local"

    # Create the AD account using data from the current CSV row
    New-ADUser `
        -Name "$($user.FirstName) $($user.LastName)" `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -SamAccountName $user.Username `
        -UserPrincipalName "$($user.Username)@bjorklunda.local" `
        -Path $ouPath `
        -Enabled $true `
        -AccountPassword (ConvertTo-SecureString "Welcome2024!" -AsPlainText -Force)

    # Add the user to the correct AD security group
    Add-ADGroupMember -Identity $user.ADGroup -Members $user.Username

    # Confirm that the account was created
    Write-Host "CREATED: $($user.Username)" -ForegroundColor Green
}
