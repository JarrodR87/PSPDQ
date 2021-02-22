function Get-PDQRemoteConsoleServer {
    <#
        .SYNOPSIS
            Queries the Local Registry to find the PDQ Console Server
        .DESCRIPTION
            Get-ItemProperty for each PDQ Deploy and Inventory and checks the current Remote ServerHostName
        .EXAMPLE
            Get-PDQRemoteConsoleServer
    #>
    [CmdletBinding()]
    Param(
        
    ) 
    BEGIN { 

        $PDQConsoleServer = @()

        $PDQDeploy = (Get-ItemProperty 'HKLM:\SOFTWARE\Admin Arsenal\PDQ Deploy\Protocol\').serverhostname
        $PDQInventory = (Get-ItemProperty 'HKLM:\SOFTWARE\Admin Arsenal\PDQ Inventory\Protocol\').serverhostname
    } #BEGIN

    PROCESS {
        $Row = New-Object PSObject
        $Row | Add-Member -type NoteProperty -Name 'PDQDeploy' -Value $PDQDeploy
        $Row | Add-Member -type NoteProperty -Name 'PDQInventory' -Value $PDQInventory
        $PDQConsoleServer += $Row
    } #PROCESS

    END { 
        $PDQConsoleServer
    } #END

} #FUNCTION